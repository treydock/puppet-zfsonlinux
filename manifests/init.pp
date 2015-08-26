# Class: zfsonlinux: See README.md for documentation
class zfsonlinux (
  $baseurl                      = $zfsonlinux::params::baseurl,
  $source_baseurl               = $zfsonlinux::params::source_baseurl,
  $testing_baseurl              = $zfsonlinux::params::testing_baseurl,
  $testing_source_baseurl       = $zfsonlinux::params::testing_source_baseurl,
  $package_name                 = $zfsonlinux::params::package_name,
  $service_ensure               = 'running',
  $service_enable               = true,
  $service_name                 = $zfsonlinux::params::service_name,
  $service_hasstatus            = $zfsonlinux::params::service_hasstatus,
  $service_hasrestart           = $zfsonlinux::params::service_hasrestart,
  $service_status               = $zfsonlinux::params::service_status,
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
  $tunables                     = {},
  $zfs_arc_max_percent          = undef,
) inherits zfsonlinux::params {

  validate_bool($manage_zed, $manage_zed_service, $enable_zed)
  validate_hash($tunables)

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
      include ::epel

      Anchor['zfsonlinux::begin']->
      Class['zfsonlinux::repo::el']->
      Yumrepo['epel']->
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
