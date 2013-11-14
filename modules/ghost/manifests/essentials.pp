# Take from openbadges setup.

class essentials {
  group { "puppet" :
    ensure => present,
    name => "puppet";
  }


  Package { ensure => installed }

  package {
    [ "git-core",
    "curl",
    "libssl-dev",
    "python",
    "zsh",
    "build-essential"
    ]:
  }


  file { "/home/vagrant/software":
    ensure => "directory",
  }

  file { "setup.sh":
    path => "/home/vagrant/setup.sh",
    source => "puppet:///modules/ghost/scripts/setup.sh",
    ensure => "present",
  }
  
#  file { "/usr/local":
#    recurse => true,
#    group => "vagrant",
#    owner => "vagrant";
#  }
}
