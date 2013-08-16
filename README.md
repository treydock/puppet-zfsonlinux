# puppet-zfsonlinux [![Build Status](https://travis-ci.org/treydock/puppet-zfsonlinux.png)](https://travis-ci.org/treydock/puppet-zfsonlinux)

Puppet module for managing ZFS on Linux.

## Support

* CentOS 6.4 x86_64
* Scientific Linux 6.4 x86_64

## Reference

### Class: zfsonlinux

Installs the packages for ZFS and starts the ZFS service.

    class { 'zfsonlinux': }

Installs ZFS and sets zfs_arc_max to 240457728

    class { 'zfsonlinux':
      tunables  => { 'zfs_arc_max' => '240457728' },
    }

### Class: zfsonlinux::monitor

Installs items necessary to monitor ZFS using Zabbix.  Currently only Zabbix is supported.

    class { 'zfsonlinux::monitor':
      monitor_tool => 'zabbix',
    }

Monitor ZFS using Zabbix and do not add the default 'zabbix' user to sudoers

    class { 'zfsonlinux::monitor':
      monitor_tool  => 'zabbix'
      manage_sudo   => false,
    }

### Class: zfsonlinux::scripts

This class installs helper scripts for ZFS

#### Script: /usr/local/sbin/mk_vdev_alias.rb

This script is intended to aid in the creation of **/etc/zfs/vdev_id.conf**

By default it excludes all disks with paritions (based on lsblk output).

    # /usr/local/sbin/mk_vdev_alias.rb
    alias d01 /dev/disk/by-path/pci-0000:00:0d.0-scsi-1:0:0:0
    alias d02 /dev/disk/by-path/pci-0000:00:0d.0-scsi-2:0:0:0

To include partitioned disks, pass the **--exclude=** option

    # /usr/local/sbin/mk_vdev_alias.rb --exclude=
    alias d01 /dev/disk/by-path/pci-0000:00:0d.0-scsi-0:0:0:0
    alias d02 /dev/disk/by-path/pci-0000:00:0d.0-scsi-1:0:0:0
    alias d03 /dev/disk/by-path/pci-0000:00:0d.0-scsi-2:0:0:0

To save the output to /etc/zfs/vdev_id.conf

    # /usr/local/sbin/mk_vdev_alias.rb --exclude= --output /etc/zfs/vdev_id.conf

Once this script is run udev must be triggered to generate the /dev/disk/by-vdev paths [Reference](http://zfsonlinux.org/faq.html#HowDoISetupVdevIdConf)

    # udevadm trigger
    # ls -l /dev/disk/by-vdev/
    total 0
    lrwxrwxrwx 1 root root  9 Aug 16 20:13 d01 -> ../../sda
    lrwxrwxrwx 1 root root 10 Aug 16 20:13 d01-part1 -> ../../sda1
    lrwxrwxrwx 1 root root 10 Aug 16 20:13 d01-part2 -> ../../sda2
    lrwxrwxrwx 1 root root  9 Aug 16 20:13 d02 -> ../../sdb
    lrwxrwxrwx 1 root root 10 Aug 16 20:13 d02-part1 -> ../../sdb1
    lrwxrwxrwx 1 root root 10 Aug 16 20:13 d02-part9 -> ../../sdb9
    lrwxrwxrwx 1 root root  9 Aug 16 20:13 d03 -> ../../sdc
    lrwxrwxrwx 1 root root 10 Aug 16 20:13 d03-part1 -> ../../sdc1
    lrwxrwxrwx 1 root root 10 Aug 16 20:13 d03-part9 -> ../../sdc9

### Class: zfsonlinux::arcstat

This class manages the packages necessary to use the **arcstat.pl** script.

This class is included by default when the **zfsonlinux::monitor** class is defined.

Currently the RPMs are pulled from a non-official source.  See [Additional Information](#additional-information).

## Development

### Dependencies

* rake
* bundler

### Unit testing

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake ci

### Vagrant system tests

If you have Vagrant >= 1.1.0 installed you can run system tests

    bundle exec rake spec:system

To test this module against Scientific Linux, the following rake command can be used

    RSPEC_SET=scientific-64-x64 bundle exec rake spec:system

## Additional Information

[ZFS on Linux](http://zfsonlinux.org/)
[arcstat RPMs](http://yum.tamu.edu/zfsonlinux/epel/6/x86_64/repoview/)
