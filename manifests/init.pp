# == Class: zfsonlinux
#
# Adds zfs to Linux systems using the zfsonlinux project.
#
# === Parameters
#
# [*tunables*]
#   Hash that defines ZFS module options.
#   Default: {}
#
# [*zfs_baseurl*]
#   The zfs repository baseurl
#   Default: $zfsonlinux::params::zfs_baseurl
#
# [*zfs_source_baseurl*]
#   The zfs-source repository baseurl
#   Default: $zfsonlinux::params::zfs_source_baseurl
#
# [*yum_priorities_package*]
#   Default: $zfsonlinux::params::yum_priorities_package
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
# [*zfs_service_status*]
#   Command used to determine zfs service's status.
#   Default: $zfsonlinux::params::zfs_service_hasstatus
#
# [*package_require*]
#   Default: $zfsonlinux::params::package_require
#
# [*include_scripts*]
#   Sets if the zfsonlinux::scripts class should be included
#   Default: false
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
  $package_ensure         = 'installed',
  $zfs_package_name       = $zfsonlinux::params::zfs_package_name,
  $zfs_service_name       = $zfsonlinux::params::zfs_service_name,
  $zfs_service_hasstatus  = $zfsonlinux::params::zfs_service_hasstatus,
  $zfs_service_hasrestart = $zfsonlinux::params::zfs_service_hasrestart,
  $zfs_service_status     = $zfsonlinux::params::zfs_service_status,
  $package_require        = $zfsonlinux::params::package_require,
  $include_scripts        = false
) inherits zfsonlinux::params {

  include zfsonlinux::repo

  validate_hash($tunables)
  validate_bool($include_scripts)

  if $include_scripts { include zfsonlinux::scripts }

  # These packages are not pulled in by the RPM
  # This is a bug in 0.6.1, fixed once 0.6.2 is released
  # Ref: https://github.com/zfsonlinux/zfs/issues/1380
  $package_dependencies = $zfsonlinux::params::package_dependencies
  ensure_packages($package_dependencies)

  package { 'zfs':
    ensure  => $package_ensure,
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
