# == Class: zfsonlinux::service
#
# private class
#
class zfsonlinux::service {

  include ::zfsonlinux

  service { 'zfs':
    ensure     => $::zfsonlinux::service_ensure,
    enable     => $::zfsonlinux::service_enable,
    hasstatus  => $::zfsonlinux::service_hasstatus,
    hasrestart => $::zfsonlinux::service_hasrestart,
    status     => $::zfsonlinux::service_status,
    name       => $::zfsonlinux::service_name,
  }

}
