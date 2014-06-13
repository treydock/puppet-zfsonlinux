# == Class: zfsonlinux
#
class zfsonlinux (
  $baseurl                      = $zfsonlinux::params::baseurl,
  $source_baseurl               = $zfsonlinux::params::source_baseurl,
  $testing_baseurl              = $zfsonlinux::params::testing_baseurl,
  $testing_source_baseurl       = $zfsonlinux::params::testing_source_baseurl,
  $package_ensure               = 'installed',
  $package_name                 = $zfsonlinux::params::package_name,
  $service_ensure               = 'running',
  $service_enable               = true,
  $service_name                 = $zfsonlinux::params::service_name,
  $service_hasstatus            = $zfsonlinux::params::service_hasstatus,
  $service_hasrestart           = $zfsonlinux::params::service_hasrestart,
  $service_status               = $zfsonlinux::params::service_status,
  $zed_debug_log                = '/tmp/zed.debug.log',
  $zed_email                    = 'UNSET',
  $zed_email_verbose            = '0',
  $zed_email_interval_secs      = '3600',
  $zed_lockdir                  = '/var/lock',
  $zed_rundir                   = '/var/run',
  $zed_syslog_priority          = 'daemon.notice',
  $zed_syslog_tag               = 'zed',
  $zed_spare_on_io_errors       = '0',
  $zed_spare_on_checksum_errors = '0',
  $tunables                     = {},
) inherits zfsonlinux::params {

  validate_hash($tunables)

  include ::zfsonlinux::install
  include ::zfsonlinux::config
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
      Class['zfsonlinux::service']->
      Anchor['zfsonlinux::end']
    }
    default: {
      # Do nothing
    }
  }

}
