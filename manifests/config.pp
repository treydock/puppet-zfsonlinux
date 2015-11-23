# Private class
class zfsonlinux::config {

  include ::zfsonlinux

  $tunables = $::zfsonlinux::_tunables

  file { '/etc/modprobe.d/zfs.conf':
    ensure  => 'file',
    content => template('zfsonlinux/zfs.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  if versioncmp($::zfsonlinux::version, '0.6.5') >= 0 {
    $_service_configs_defaults = {
      'ensure' => 'present',
      'target' => $::zfsonlinux::service_config_path,
    }
    create_resources(shellvar, $::zfsonlinux::service_configs, $_service_configs_defaults)
  }

}
