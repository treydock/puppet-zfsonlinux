# == Class: zfsonlinux::monitor::scripts
#
# Installs arcstat_get.py
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::monitor::scripts {

  include zfsonlinux::monitor

  $scripts_dir = $zfsonlinux::monitor::scripts_dir

  file { 'arcstat_get.py':
    ensure  => present,
    path    => "${scripts_dir}/arcstat_get.py",
    source  => 'puppet:///modules/zfsonlinux/arcstat_get.py',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
}
