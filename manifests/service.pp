# Private class
class zfsonlinux::service {

  include ::zfsonlinux

  if versioncmp($::zfsonlinux::version, '0.6.5') >= 0 {
    service { 'zfs-import':
      ensure    => $::zfsonlinux::_import_service_ensure,
      enable    => $::zfsonlinux::_import_service_enable,
      hasstatus => $::zfsonlinux::service_hasstatus,
      status    => $::zfsonlinux::service_status,
    }
    service { 'zfs-mount':
      ensure => $::zfsonlinux::_mount_service_ensure,
      enable => $::zfsonlinux::_mount_service_enable,
    }
    service { 'zfs-share':
      ensure => $::zfsonlinux::_share_service_ensure,
      enable => $::zfsonlinux::_share_service_enable,
    }
    service { 'zfs-zed':
      ensure => $::zfsonlinux::_zed_service_ensure,
      enable => $::zfsonlinux::_zed_service_enable,
    }
  } else {
    service { 'zfs':
      ensure     => $::zfsonlinux::service_ensure,
      enable     => $::zfsonlinux::service_enable,
      hasstatus  => $::zfsonlinux::service_hasstatus,
      hasrestart => $::zfsonlinux::service_hasrestart,
      status     => $::zfsonlinux::service_status,
      name       => $::zfsonlinux::service_name,
    }

    if $::zfsonlinux::manage_zed {
      file_line { 'enable zed':
        ensure => $::zfsonlinux::zed_service_enable,
        path   => '/etc/rc.local',
        line   => '/sbin/zed',
        after  => 'touch /var/lock/subsys/local',
      }

      if $::zfsonlinux::manage_zed_service {
        service { 'zed':
          ensure   => $::zfsonlinux::zed_service_ensure,
          binary   => 'zed',
          provider => 'base',
        }
      }
    }
  }

}
