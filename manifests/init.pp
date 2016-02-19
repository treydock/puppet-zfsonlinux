# Class: zfsonlinux: See README.md for documentation
class zfsonlinux (
  $version                      = $zfsonlinux::params::version,
  $release_url                  = $zfsonlinux::params::release_url,
  $baseurl                      = $zfsonlinux::params::baseurl,
  $source_baseurl               = $zfsonlinux::params::source_baseurl,
  $testing_baseurl              = $zfsonlinux::params::testing_baseurl,
  $testing_source_baseurl       = $zfsonlinux::params::testing_source_baseurl,
  $package_name                 = $zfsonlinux::params::package_name,
  $devel_package_name           = $zfsonlinux::params::devel_package_name,
  $install_devel_package        = false,
  $service_ensure               = 'running',
  $service_enable               = true,
  $service_name                 = $zfsonlinux::params::service_name,
  $service_hasstatus            = $zfsonlinux::params::service_hasstatus,
  $service_hasrestart           = $zfsonlinux::params::service_hasrestart,
  $service_status               = $zfsonlinux::params::service_status,
  $enable_import_service        = true,
  $enable_mount_service         = true,
  $enable_share_service         = true,
  $manage_zed                   = true,
  $manage_zed_service           = true,
  $enable_zed                   = true,
  $zed_debug_log                = '/tmp/zed.debug.log',
  $zed_email                    = undef,
  $zed_email_verbose            = '0',
  $zed_email_interval_secs      = '3600',
  $zed_lockdir                  = '/var/lock',
  $zed_rundir                   = '/var/run',
  $zed_syslog_priority          = 'daemon.notice',
  $zed_syslog_tag               = 'zed',
  $zed_spare_on_io_errors       = '0',
  $zed_spare_on_checksum_errors = '0',
  $service_config_path          = $zfsonlinux::params::service_config_path,
  $service_configs              = {},
  $tunables                     = {},
  $zfs_arc_max_percent          = undef,
) inherits zfsonlinux::params {

  validate_bool($install_devel_package)
  validate_bool($manage_zed, $manage_zed_service, $enable_zed)
  validate_bool($enable_import_service, $enable_mount_service, $enable_share_service)
  validate_hash($service_configs, $tunables)

  case $::osfamily {
    'RedHat': {
      $_package_version = "${version}-1.el${::operatingsystemmajrelease}"
    }
    default: {
      # Do nothing
    }
  }

  # If ZFS is already installed - just set package to 'present'
  # Avoid accidental upgrades to ZFS
  if $::zol_version {
    $_package_ensure = 'present'
    $_devel_package_ensure = "${::zol_version}-1.el${::operatingsystemmajrelease}"
  } else {
    $_package_ensure = $_package_version
    $_devel_package_ensure = $_package_version
  }

  if $enable_zed {
    if $manage_zed_service {
      $zed_service_enable = 'present'
    } else {
      $zed_service_enable = 'absent'
    }
    $zed_service_ensure = 'running'
  } else {
    $zed_service_ensure = 'stopped'
    $zed_service_enable = 'absent'
  }

  if versioncmp($::zfsonlinux::version, '0.6.5') >= 0 {
    if $enable_import_service {
      $_import_service_ensure = 'running'
      $_import_service_enable = true
    } else {
      $_import_service_ensure = undef
      $_import_service_enable = false
    }
    if $enable_mount_service {
      $_mount_service_ensure = 'running'
      $_mount_service_enable = true
    } else {
      $_mount_service_ensure = undef
      $_mount_service_enable = false
    }
    if $enable_share_service {
      $_share_service_ensure = 'running'
      $_share_service_enable = true
    } else {
      $_share_service_ensure = undef
      $_share_service_enable = false
    }
    if $enable_zed {
      $_zed_service_ensure = 'running'
      $_zed_service_enable = true
    } else {
      $_zed_service_ensure = 'stopped'
      $_zed_service_enable = false
    }
  }

  if $zfs_arc_max_percent {
    $_zfs_arc_max_percent = percent_memory_to_bytes($zfs_arc_max_percent)
  } else {
    $_zfs_arc_max_percent = undef
  }

  $_extra_tunables = delete_undef_values({
    'zfs_arc_max' => $_zfs_arc_max_percent
  })
  $_tunables = merge($_extra_tunables, $tunables)

  include ::zfsonlinux::install
  include ::zfsonlinux::config
  include ::zfsonlinux::zed
  include ::zfsonlinux::service

  anchor { 'zfsonlinux::begin': }
  anchor { 'zfsonlinux::end': }

  case $::osfamily {
    'RedHat': {
      include ::zfsonlinux::repo::el

      Anchor['zfsonlinux::begin']->
      Class['zfsonlinux::repo::el']->
      Class['zfsonlinux::install']->
      Class['zfsonlinux::config']->
      Class['zfsonlinux::zed']->
      Class['zfsonlinux::service']->
      Anchor['zfsonlinux::end']
    }
    default: {
      # Do nothing
    }
  }

}
