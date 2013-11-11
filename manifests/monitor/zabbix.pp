# == Class: zfsonlinux::monitor::zabbix
#
# Adds custom checks for Zabbix to monitor ZFS
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::monitor::zabbix {

  include zfsonlinux::monitor

  $monitor_tool_conf_dir  = $zfsonlinux::monitor::monitor_tool_conf_dir_real
  $manage_sudo            = $zfsonlinux::monitor::manage_sudo
  $include_scripts        = $zfsonlinux::monitor::include_scripts
  $scripts_dir            = $zfsonlinux::monitor::scripts_dir

  $file_require = $manage_sudo ? {
    true  => [File['/etc/sudoers.d/zfs'], File[$monitor_tool_conf_dir]],
    false => File[$monitor_tool_conf_dir],
  }

  file { '/etc/zabbix_agentd.conf.d/zfs.conf':
    ensure  => present,
    path    => "${monitor_tool_conf_dir}/zfs.conf",
    content => template('zfsonlinux/monitor/zabbix/zfs.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => $file_require,
    notify  => Service['zabbix-agent'],
  }

  if $include_scripts {
    file { 'zfs_trapper.rb':
      ensure  => present,
      path    => "${scripts_dir}/zfs_trapper.rb",
      source  => 'puppet:///modules/zfsonlinux/zfs_trapper.rb',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      before  => Cron['zfs_trapper.rb'],
    }

    cron { 'zfs_trapper.rb':
      ensure    => present,
      command   => "${scripts_dir}/zfs_trapper.rb",
      user      => 'root',
      hour      => absent,
      minute    => '*/5',
      month     => absent,
      monthday  => absent,
      weekday   => absent,
    }

    file { 'zpool_trapper.rb':
      ensure  => present,
      path    => "${scripts_dir}/zpool_trapper.rb",
      source  => 'puppet:///modules/zfsonlinux/zpool_trapper.rb',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      before  => Cron['zpool_trapper.rb'],
    }

    cron { 'zpool_trapper.rb':
      ensure    => present,
      command   => "${scripts_dir}/zpool_trapper.rb",
      user      => 'root',
      hour      => absent,
      minute    => '*/5',
      month     => absent,
      monthday  => absent,
      weekday   => absent,
    }
  }
}
