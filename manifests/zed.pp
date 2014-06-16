# == Class: zfsonlinux::zed
#
# private class
#
class zfsonlinux::zed {

  include ::zfsonlinux

  if $::zfsonlinux::manage_zed {
    $zed_email_ensure = $::zfsonlinux::zed_email ? {
      'UNSET' => 'absent',
      default => 'present',
    }

    Shellvar {
      ensure  => 'present',
      target  => '/etc/zfs/zed.d/zed.rc',
      #comment => 'managed by Puppet!',
    }

    shellvar { 'ZED_DEBUG_LOG': value => $::zfsonlinux::zed_debug_log }
    shellvar { 'ZED_EMAIL': ensure => $zed_email_ensure, value => $::zfsonlinux::zed_email }
    shellvar { 'ZED_EMAIL_VERBOSE': value => $::zfsonlinux::zed_email_verbose }
    shellvar { 'ZED_EMAIL_INTERVAL_SECS': value => $::zfsonlinux::zed_email_interval_secs }
    shellvar { 'ZED_LOCKDIR': value => $::zfsonlinux::zed_lockdir }
    shellvar { 'ZED_RUNDIR': value => $::zfsonlinux::zed_rundir }
    shellvar { 'ZED_SYSLOG_PRIORITY': value => $::zfsonlinux::zed_syslog_priority }
    shellvar { 'ZED_SYSLOG_TAG': value => $::zfsonlinux::zed_syslog_tag }
    shellvar { 'ZED_SPARE_ON_IO_ERRORS': value => $::zfsonlinux::zed_spare_on_io_errors }
    shellvar { 'ZED_SPARE_ON_CHECKSUM_ERRORS': value => $::zfsonlinux::zed_spare_on_checksum_errors }
  }

}
