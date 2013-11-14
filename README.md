# vagrant-seed

## Instructions

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant 1.2.2](http://downloads.vagrantup.com/tags/v1.2.2)

	- *Linux Users:* Install an NFS daemon, e.g. `apt-get install nfs-kernel-server` 
	- Add Ubuntu 12.04 LTS `vagrant box add ub1204 "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"` 
	- After the download is done, you have a box ub1204 where the Ubuntu 12.04 LTS image resides

- Clone this repo and into it.
- Run `vagrant up`.
- Login to the VM with `vagrant ssh`

- Install git submodules: `git submodule update --recursive`
- Install dependencies: `npm install`
- Build Admin styles: `grunt init`
- Run the Ghost App: `node index.js` or `npm start`
- Validate code: `grunt validate`

## Updating Virtual Box Guest Additions

The packaged vagrant box from Ubuntu contains outdated Virtual Box Guest Additions.  Most of the time this shouldn't be a problem, but if you want to update them I recommend this procedure:

1. Install the [vagrant-vbguest plugin](https://github.com/dotless-de/vagrant-vbguest): `vagrant plugin install vagrant-vbguest`
1. Boot the vm without provisioning: `vagrant up --no-provision`
1. Login with `vagrant ssh` and run `sudo apt-get -y -q purge virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11`
1. Logout and `vagrant halt`
1. `vagrant up`

## Thanks to these projects for inspiration
- Ghost-Vagrant

## Copyright & License

The MIT License (MIT)

Copyright (c) 2013 phase-transition

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
