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

  include zfsonlinux::params

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
    descr           => "ZFS of Linux for EL ${::os_maj_version}",
    baseurl         => "http://archive.zfsonlinux.org/epel/${::os_maj_version}/${::architecture}/",
    enabled         => '1',
    metadata_expire => '604800',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    priority        => '1',
  }

  yumrepo { 'zfs-source':
    descr           => "ZFS of Linux for EL ${::os_maj_version} - Source",
    baseurl         => "http://archive.zfsonlinux.org/epel/${::os_maj_version}/SRPMS/",
    enabled         => '0',
    metadata_expire => '604800',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    priority        => '1',
  }
}
