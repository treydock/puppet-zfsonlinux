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
  include zfsonlinux::params

  $username       = $zfsonlinux::monitor::monitor_username_real
  $sudoers_path   = $zfsonlinux::monitor::monitor_sudoers_path
  $sudo_commands  = $zfsonlinux::monitor::monitor_sudo_commands
  $os_maj_version = $zfsonlinux::params::os_maj_version

  $sudo_commands_real = is_string($sudo_commands) ? {
    true  => $sudo_commands,
    false => join($sudo_commands, ','),
  }

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
