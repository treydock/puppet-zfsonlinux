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

  include ::zfsonlinux

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux':
    ensure  => 'file',
    source  => 'puppet:///modules/zfsonlinux/RPM-GPG-KEY-zfsonlinux',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  gpg_key { 'zfsonlinux':
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    before  => Yumrepo['zfs','zfs-source','zfs-testing','zfs-testing-source'],
  }

  yumrepo { 'zfs':
    descr           => "ZFS on Linux for EL ${::operatingsystemmajrelease}",
    baseurl         => $::zfsonlinux::baseurl,
    enabled         => '1',
    metadata_expire => '7d',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
  }

  yumrepo { 'zfs-source':
    descr           => "ZFS on Linux for EL ${::operatingsystemmajrelease} - Source",
    baseurl         => $::zfsonlinux::source_baseurl,
    enabled         => '0',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
  }

  yumrepo { 'zfs-testing':
    descr           => "ZFS on Linux for EL ${::operatingsystemmajrelease} - Testing",
    baseurl         => $::zfsonlinux::testing_baseurl,
    enabled         => '0',
    metadata_expire => '7d',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
  }

  yumrepo { 'zfs-testing-source':
    descr           => "ZFS on Linux for EL ${::operatingsystemmajrelease} - Testing Source",
    baseurl         => $::zfsonlinux::testing_source_baseurl,
    enabled         => '0',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
  }
}
