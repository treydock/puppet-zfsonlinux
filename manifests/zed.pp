# Private class
class zfsonlinux::zed {

  include ::zfsonlinux

  if $::zfsonlinux::manage_zed {
    shellvar { 'ZED_DEBUG_LOG': value => $::zfsonlinux::zed_debug_log, tag => 'zed' }
    shellvar { 'ZED_LOCKDIR': value => $::zfsonlinux::zed_lockdir, tag => 'zed' }
    shellvar { 'ZED_RUNDIR': value => $::zfsonlinux::zed_rundir, tag => 'zed' }
    shellvar { 'ZED_SYSLOG_PRIORITY': value => $::zfsonlinux::zed_syslog_priority, tag => 'zed' }
    shellvar { 'ZED_SYSLOG_TAG': value => $::zfsonlinux::zed_syslog_tag, tag => 'zed' }
    shellvar { 'ZED_SPARE_ON_IO_ERRORS': value => $::zfsonlinux::zed_spare_on_io_errors, tag => 'zed' }
    shellvar { 'ZED_SPARE_ON_CHECKSUM_ERRORS': value => $::zfsonlinux::zed_spare_on_checksum_errors, tag => 'zed' }

    if versioncmp($::zfsonlinux::version, '0.6.5') >= 0 {
      $_zed_notify = Service['zfs-zed']
      if $::zfsonlinux::zed_email {
        shellvar { 'ZED_EMAIL_ADDR': value => $::zfsonlinux::zed_email, tag => 'zed' }
      }
      shellvar { 'ZED_EMAIL_PROG': value => 'mail', tag => 'zed' }
      shellvar { 'ZED_NOTIFY_INTERVAL_SECS': value => $::zfsonlinux::zed_email_interval_secs, tag => 'zed' }
      shellvar { 'ZED_NOTIFY_VERBOSE': value => $::zfsonlinux::zed_email_verbose, tag => 'zed' }
    } else {
      $_zed_notify = Service['zed']
      if $::zfsonlinux::zed_email {
        shellvar { 'ZED_EMAIL': value => $::zfsonlinux::zed_email, tag => 'zed' }
      }
      shellvar { 'ZED_EMAIL_INTERVAL_SECS': value => $::zfsonlinux::zed_email_interval_secs, tag => 'zed' }
      shellvar { 'ZED_EMAIL_VERBOSE': value => $::zfsonlinux::zed_email_verbose, tag => 'zed' }
    }

    Shellvar <| tag == 'zed' |> {
      ensure => 'present',
      target => '/etc/zfs/zed.d/zed.rc',
      notify => $_zed_notify,
    }

  }
}
