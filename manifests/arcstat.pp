# == Class: zfsonlinux::arcstat
#
# Installs arcstat.py
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::arcstat (
  $arcstat_path = $zfsonlinux::params::arcstat_path
) inherits zfsonlinux::params {

  file { '/usr/bin/arcstat.py':
    ensure  => present,
    path    => $arcstat_path,
    source  => 'puppet:///modules/zfsonlinux/arcstat.py',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

}
