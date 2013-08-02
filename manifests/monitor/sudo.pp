# == Class: zfsonlinux::monitor::sudo
#
# Adds sudo policy for monitoring ZFS
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::monitor::sudo {

  include zfsonlinux::monitor

  $username       = $zfsonlinux::monitor::monitor_username_real
  $sudoers_path   = $zfsonlinux::monitor::monitor_sudoers_path
  $sudo_commands  = $zfsonlinux::monitor::monitor_sudo_commands

  $sudo_commands_real = is_string($sudo_commands) ? {
    true  => split($sudo_commands, ','),
    false => $sudo_commands,
  }
  validate_array($sudo_commands_real)

  if $::osfamily =~ /RedHat/ and $::os_maj_version < 6 {
    warning("Unsupported os_maj_version: ${::os_maj_version}, for RedHat osfamily.  Module ${module_name} only supports os_maj_version >= 6")
  } else {
    file { '/etc/sudoers.d/zfs':
      ensure  => present,
      path    => $sudoers_path,
      content => template('zfsonlinux/zfs.sudoers.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
      require => Package['sudo'],
    }
  }
}
