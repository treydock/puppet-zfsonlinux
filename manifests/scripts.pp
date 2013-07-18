# == Class: zfsonlinux::scripts
#
# Adds scripts used with ZFS
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::scripts {

  include zfsonlinux::params

  file { '/usr/local/sbin/mk_vdev_alias.rb':
    ensure  => present,
    source  => 'puppet:///modules/zfsonlinux/mk_vdev_alias.rb',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
}
