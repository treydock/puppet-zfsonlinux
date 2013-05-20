# == Class: zfsonlinux
#
# Adds zfs to Linux systems using the zfsonlinux project.
#
# === Parameters
#
# [*zfs_package_name*]
#   Default:  $zfsonlinux::params::zfs_package_name,
#
# [*zfs_service_name*]
#   Default:  $zfsonlinux::params::zfs_service_name,
#
# [*zfs_service_hasstatus*]
#   Default:  $zfsonlinux::params::zfs_service_hasstatus,
#
# [*zfs_service_hasrestart*]
#   Default:  $zfsonlinux::params::zfs_service_hasrestart
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
  $zfs_package_name       = $zfsonlinux::params::zfs_package_name,
  $zfs_service_name       = $zfsonlinux::params::zfs_service_name,
  $zfs_service_hasstatus  = $zfsonlinux::params::zfs_service_hasstatus,
  $zfs_service_hasrestart = $zfsonlinux::params::zfs_service_hasrestart

) inherits zfsonlinux::params {

  include zfsonlinux::repo

  # These packages are not pulled in by the RPM
  # This is a bug in 0.6.1, fixed once 0.6.2 is released
  # Ref: https://github.com/zfsonlinux/zfs/issues/1380
  $package_dependencies = $zfsonlinux::params::package_dependencies
  ensure_packages($package_dependencies)

  package { 'zfs':
    ensure  => 'installed',
    name    => $zfs_package_name,
    require => Class['zfsonlinux::repo'],
  }

  service { 'zfs':
    ensure      => running,
    enable      => true,
    hasstatus   => $zfs_service_hasstatus,
    hasrestart  => $zfs_service_hasrestart,
    name        => $zfs_service_name,
    require     => Package['zfs'],
  }

}
