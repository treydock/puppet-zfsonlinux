# Private class
class zfsonlinux::zed {

  include ::zfsonlinux

  # Class variables
  $shellvars = {
    'ZED_DEBUG_LOG'                => $::zfsonlinux::zed_debug_log,
    'ZED_EMAIL'                    => $::zfsonlinux::zed_email,
    'ZED_EMAIL_VERBOSE'            => $::zfsonlinux::zed_email_verbose,
    'ZED_EMAIL_INTERVAL_SECS'      => $::zfsonlinux::zed_email_interval_secs,
    'ZED_LOCKDIR'                  => $::zfsonlinux::zed_lockdir,
    'ZED_RUNDIR'                   => $::zfsonlinux::zed_rundir,
    'ZED_SYSLOG_PRIORITY'          => $::zfsonlinux::zed_syslog_priority,
    'ZED_SYSLOG_TAG'               => $::zfsonlinux::zed_syslog_tag,
    'ZED_SPARE_ON_IO_ERRORS'       => $::zfsonlinux::zed_spare_on_io_errors,
    'ZED_SPARE_ON_CHECKSUM_ERRORS' =>
    $::zfsonlinux::zed_spare_on_checksum_errors,
  }
  $comments  = {
    'ZED_DEBUG_LOG'                => 'Absolute path to the debug output file.',
    'ZED_EMAIL'                    => [
      'Email address of the zpool administrator.',
      'Email will only be sent if ZED_EMAIL is defined.',
    ],
    'ZED_EMAIL_VERBOSE'            => [
      'Email verbosity.',
      '  If set to 0, suppress email if the pool is healthy.',
      '  If set to 1, send email regardless of pool health.',
    ],
    'ZED_EMAIL_INTERVAL_SECS'      =>
    'Minimum number of seconds between emails sent for a similar event.',
    'ZED_LOCKDIR'                  => 'Default directory for zed lock files.',
    'ZED_RUNDIR'                   => 'Default directory for zed state files.',
    'ZED_SYSLOG_PRIORITY'          =>
    'The syslog priority (eg, specified as a "facility.level" pair).',
    'ZED_SYSLOG_TAG'               => 'The syslog tag for marking zed events.',
    'ZED_SPARE_ON_IO_ERRORS'       =>
    'Replace a device with a hot spare after N I/O errors are detected.',
    'ZED_SPARE_ON_CHECKSUM_ERRORS' =>
    'Replace a device with a hot spare after N checksum errors are detected.',
  }

  # Managed resources
  if $::zfsonlinux::manage_zed {
    file { '/etc/zfs/zed.d/zed.rc':
      ensure  => present,
      content => template('zfsonlinux/zed.rc.erb'),
      mode    => '0644',
    }
  }
}
