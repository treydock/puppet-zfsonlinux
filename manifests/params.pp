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

  case $::osfamily {
    'RedHat': {
      $zfs_baseurl            = "http://archive.zfsonlinux.org/epel/${::os_maj_version}/${::architecture}/"
      $zfs_source_baseurl     = "http://archive.zfsonlinux.org/epel/${::os_maj_version}/SRPMS/"
      $package_require        = Yumrepo['zfs']
      $zfs_package_name       = 'zfs'
      $zfs_service_name       = 'zfs'
      $zfs_service_hasstatus  = true
      $zfs_service_hasrestart = true
      $package_dependencies   = [
        'kernel-devel',
        'gcc',
        'make',
        'perl',
      ]

      $monitor_sudoers_path   = '/etc/sudoers.d/zfs'

      $kstat_package_name     = 'perl-Sun-Solaris-Kstat'
      $kstat_package_source   = "http://yum.tamu.edu/zfsonlinux/epel/${::os_maj_version}/${::architecture}/perl-Sun-Solaris-Kstat-0.01-1.el${::os_maj_version}.noarch.rpm"
      $arcstat_package_name   = 'zfs-arcstat'
      $arcstat_package_source = "http://yum.tamu.edu/zfsonlinux/epel/${::os_maj_version}/${::architecture}/zfs-arcstat-0.5-1.el${::os_maj_version}.noarch.rpm"

      case $::os_maj_version {
        '5': {
          $yum_priorities_package = 'yum-priorities'
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
