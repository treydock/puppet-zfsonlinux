# == Class: zfsonlinux
#
# Adds zfs to Linux systems using the zfsonlinux project.
#
# === Parameters
#
# [*zfs_package_name*]
#   Default: $zfsonlinux::params::zfs_package_name
#
# [*zfs_service_name*]
#   Default: $zfsonlinux::params::zfs_service_name
#
# [*zfs_service_hasstatus*]
#   Default: $zfsonlinux::params::zfs_service_hasstatus
#
# [*zfs_service_hasrestart*]
#   Default: $zfsonlinux::params::zfs_service_hasrestart
#
# [*package_require*]
#   Default: $zfsonlinux::params::package_require
#
# [*include_scripts*]
#   Sets if the zfsonlinux::scripts class should be included
#   Default: true
#
# === Examples
#
#  class { 'zfsonlinux': }
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux (
  $tunables               = {},
  $zfs_baseurl            = $zfsonlinux::params::zfs_baseurl,
  $zfs_source_baseurl     = $zfsonlinux::params::zfs_source_baseurl,
  $yum_priorities_package = $zfsonlinux::params::yum_priorities_package,
  $zfs_package_name       = $zfsonlinux::params::zfs_package_name,
  $zfs_service_name       = $zfsonlinux::params::zfs_service_name,
  $zfs_service_hasstatus  = $zfsonlinux::params::zfs_service_hasstatus,
  $zfs_service_hasrestart = $zfsonlinux::params::zfs_service_hasrestart,
  $zfs_service_status     = $zfsonlinux::params::zfs_service_status,
  $package_require        = $zfsonlinux::params::package_require,
  $include_scripts        = true
) inherits zfsonlinux::params {

  include zfsonlinux::repo

  validate_bool($include_scripts)
  if $include_scripts { include zfsonlinux::scripts }

  # These packages are not pulled in by the RPM
  # This is a bug in 0.6.1, fixed once 0.6.2 is released
  # Ref: https://github.com/zfsonlinux/zfs/issues/1380
  $package_dependencies = $zfsonlinux::params::package_dependencies
  ensure_packages($package_dependencies)

  Package[$yum_priorities_package] -> Package['zfs']

  package { 'zfs':
    ensure  => 'installed',
    name    => $zfs_package_name,
    require => $package_require,
  }

  service { 'zfs':
    ensure      => running,
    enable      => true,
    hasstatus   => $zfs_service_hasstatus,
    hasrestart  => $zfs_service_hasrestart,
    status      => $zfs_service_status,
    name        => $zfs_service_name,
    require     => Package['zfs'],
  }

  file { '/etc/modprobe.d/zfs.conf':
    ensure  => present,
    content => template('zfsonlinux/zfs.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    before  => Service['zfs'],
  }
}
