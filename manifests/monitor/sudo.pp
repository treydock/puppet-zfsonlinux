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
    true  => $sudo_commands,
    false => join($sudo_commands, ','),
  }

  if $::osfamily =~ /RedHat/ and $::os_maj_version < 6 {
    file_line { "sudo disable requiretty for ${username}":
      path  => '/etc/sudoers',
      line  => "Defaults:${username} !requiretty",
      match => "^Defaults:${username}.*$",
    }->
    file_line { 'sudo define ZFS_CMDS':
      path  => '/etc/sudoers',
      line  => "Cmnd_Alias ZFS_CMDS = ${sudo_commands_real}",
      match => '^Cmnd_Alias\s+ZFS_CMDS\s+=.*$',
    }->
    file_line { "sudo allow ${username} to execute ZFS_CMDS":
      path  => '/etc/sudoers',
      line  => "${username} ALL=(ALL) NOPASSWD: ZFS_CMDS",
      match => "^${username}\\s+ALL=\\(ALL\\)\\s+NOPASSWD:\\s+ZFS_CMDS$",
    }
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
