# Private class
class zfsonlinux::repo::el {

  include ::zfsonlinux

  exec { 'RPM-GPG-KEY-zfsonlinux':
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    command => "wget -qO- ${zfsonlinux::release_url} | rpm2cpio - | cpio -i --quiet --to-stdout ./etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux > /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux",
    creates => '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
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
    descr    => "ZFS on Linux for EL ${::operatingsystemmajrelease} - Source",
    baseurl  => $::zfsonlinux::source_baseurl,
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
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
    descr    => "ZFS on Linux for EL ${::operatingsystemmajrelease} - Testing Source",
    baseurl  => $::zfsonlinux::testing_source_baseurl,
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
  }
}
