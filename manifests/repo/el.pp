# == Class: zfsonlinux::repo::el
#
# Adds the zfsonlinux repo to Enterprise Linux systems.
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::repo::el {

  include zfsonlinux
  include zfsonlinux::params

  $zfs_baseurl            = $zfsonlinux::zfs_baseurl
  $zfs_source_baseurl     = $zfsonlinux::zfs_source_baseurl
  $yum_priorities_package = $zfsonlinux::yum_priorities_package
  $os_maj_version         = $zfsonlinux::params::os_maj_version

  if !defined(Package[$yum_priorities_package]) {
    package { $yum_priorities_package:
      ensure  => installed,
    }
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux':
    ensure  => present,
    source  => 'puppet:///modules/zfsonlinux/RPM-GPG-KEY-zfsonlinux',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  gpg_key { 'zfsonlinux':
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    before  => Yumrepo['zfs','zfs-source'],
  }

  # The yumrepo resources have priority set to
  # force the installation of dkms from zfs repo
  # instead of EPEL
  # Ref: https://github.com/zfsonlinux/zfs/issues/1466
  yumrepo { 'zfs':
    descr           => "ZFS of Linux for EL ${os_maj_version}",
    baseurl         => $zfs_baseurl,
    enabled         => '1',
    metadata_expire => '604800',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    priority        => '1',
  }

  yumrepo { 'zfs-source':
    descr           => "ZFS of Linux for EL ${os_maj_version} - Source",
    baseurl         => $zfs_source_baseurl,
    enabled         => '0',
    metadata_expire => '604800',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    priority        => '1',
  }
}
