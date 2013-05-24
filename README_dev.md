# Development testing outside rspec

Due to the complexity and somewhat unstable nature of this branch, a Vagrantfile is provided to hopefully
allow testing of how the zpool type will behave under various circumstances.

**NOTE: Currently development tests fail due to unexpected error received by Puppet during the 'zpool create' command.**

## Dependencies

* Ruby 1.8.7
* Bundler
* Vagrant >= 1.2.0

## Running tests in vagrant

The first time `vagrant up` is run there will be a lengthy download of the base box.  See the Vagrantfile comments for using a CentOS base box instead of the unofficial Scientific Linux box.

### Starting vagrant box

    cd /path/to/this/module
    vagrant up
    vagrant ssh

The commands above perform these actions

* Starts the Vagrant VM
* Ensures Puppet is installed
* Installs the puppetlabs-stdlib module
* Creates the file /etc/zfs/vdev_id.conf to use with ZFS
* Runs `udevadm trigger`
* Applies the zfsonlinux module
* Once the VM is built and provisioned, the `vagrant ssh` logs you into the VM

### Performing ZFS tests

These steps are run from within the Vagrant VM

    sudo su -
    cd /etc/puppet

To build a zpool using striped RAIDZ2 apply the testing zpool module with no parameters

    puppet apply --debug --modulepath ./modules -e "class { 'zpool': }"

To test the striped mirror configuration pass the `type => 'mirror'` parameter

    puppet apply --debug --modulepath ./modules -e "class { 'zpool': type => 'mirror' }"

To rerun the test and destroy the zpool, pass the `destroy => true` parameter

    puppet apply --debug --modulepath ./modules -e "class { 'zpool': destroy => true }"
