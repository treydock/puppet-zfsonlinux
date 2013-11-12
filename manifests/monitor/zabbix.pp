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
}
