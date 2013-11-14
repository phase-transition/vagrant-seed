
class ghost($node_version = "v0.10.22") {
    # Add some default path values
    Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin', "/home/vagrant/nvm/${node_version}/bin"], }

    # Base packages 
    class { essentials: }

    # Install and setup nginx web server
    class { nginx:
        require => [Class["essentials"]]
    }

    # Install and setup phantomjs and casperjs
    # class { casperjs:
    #     require => [Class["essentials"]]
    # }

    # Install node through NVM
    class { 'nvm':
        node_version => $node_version,
        require => [Class["essentials"]]
    }

    # This function depends on some commands in the nvm.pp file
    define npm( $directory="/home/vagrant/nvm/${ghost::node_version}/lib/node_modules" ) {
      exec { "install-${name}-npm-package":
        unless => "test -d ${directory}/${name}",
        command => "npm install -g ${name}",
        require => Exec['install-node'],
      }
    }

    # Global npm modules
    npm { ["grunt-cli",
           "forever",
           "yo",
           "generator-angular",
           "protractor",
           "express",
           "karma",
           "mocha" ]:
    }  

    # Examples of installing packages from a package.json if we need to.
    # exec { "npm-install-packages":
    #   cwd => "/vagrant/ghost",
    #   command => "npm install .",
    #   require => Exec['install-node'],
    # }

    # exec { 'git-clone-zsh-env': 
    #   cwd => "/home/vagrant/",
    #   command => "/usr/bin/git clone https://github.com/phase-transition/zsh-env.git",
    #   require => Package["git-core"],
    # }

    exec { 'git-clone-ghost': 
      cwd => "/home/vagrant/",
      command => "/usr/bin/git clone https://github.com/phase-transition/ghost-0.3.3.git",
      require => Package["git-core"],
    }

    exec { 'setup-env':
      cwd => "/home/vagrant",
      command => "sh setup.sh", 
      #command => "chown -R vagrant:vagrant /home/vagrant ", 
      require => [File['setup.sh'], Exec['git-clone-zsh-env']],
    }
}
