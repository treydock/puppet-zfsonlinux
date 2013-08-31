# Class: zfsonlinux::params
#
#   The zfsonlinux configuration settings.
#
# === Variables
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::params {

  $monitor_tool_defaults  = {
    'zabbix' => {
      'username'  => 'zabbix',
      'conf_dir'  => '/etc/zabbix_agentd.conf.d',
    },
  }

  $monitor_sudo_commands  = [
    '/sbin/zpool status *',
    '/sbin/zpool list *',
    '/sbin/zfs list *',
    '/sbin/zfs get *'
  ]

  $os_maj_version = $::os_maj_version ? {
    undef   => inline_template('<%= scope.lookupvar(\'::operatingsystemrelease\').split(\'.\').first %>'),
    default => $::os_maj_version,
  }

  case $::osfamily {
    'RedHat': {
      $zfs_baseurl            = "http://archive.zfsonlinux.org/epel/${os_maj_version}/${::architecture}/"
      $zfs_source_baseurl     = "http://archive.zfsonlinux.org/epel/${os_maj_version}/SRPMS/"
      $package_require        = Yumrepo['zfs']
      $zfs_package_name       = 'zfs'
      $zfs_service_name       = 'zfs'
      $zfs_service_hasstatus  = false
      $zfs_service_hasrestart = true
      $zfs_service_status     = 'lsmod | egrep -q "^zfs"'
      $package_dependencies   = [
        'kernel-devel',
        'gcc',
        'make',
        'perl',
      ]

      $monitor_sudoers_path   = '/etc/sudoers.d/zfs'

      $arcstat_path           = '/usr/bin/arcstat.py'

      case $os_maj_version {
        '5': {
          fail("Unsupported operatingsystemrelease: ${::operatingsystemrelease}, module ${module_name} only supports >= 6.0")
        }
        default: {
          $yum_priorities_package = 'yum-plugin-priorities'
        }
      }
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
