require 'spec_helper'

describe 'zfsonlinux::repo::el' do
  include_context :defaults
  
  let(:facts) { default_facts }

  it { should create_class('zfsonlinux::repo::el') }
  it { should include_class('zfsonlinux') }
  it { should include_class('zfsonlinux::params') }

  it do
    should contain_package('yum-plugin-priorities').with({
      'ensure'  => 'installed',
      'before'  => 'Package[zfs]',
    })
  end

  it do
    should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux').with({
      'ensure'  => 'present',
      'source'  => 'puppet:///modules/zfsonlinux/RPM-GPG-KEY-zfsonlinux',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
    })
  end

  it do
    should contain_gpg_key('zfsonlinux').with({
      'path'    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
      'before'  => ['Yumrepo[zfs]', 'Yumrepo[zfs-source]'],
    })
  end

  it do
    should contain_yumrepo('zfs').with({
      'descr'           => 'ZFS of Linux for EL 6',
      'baseurl'         => 'http://archive.zfsonlinux.org/epel/6/x86_64/',
      'enabled'         => '1',
      'metadata_expire' => '604800',
      'gpgcheck'        => '1',
      'gpgkey'          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
      'priority'        => '1',
    })
  end

  it do
    should contain_yumrepo('zfs-source').with({
      'descr'           => 'ZFS of Linux for EL 6 - Source',
      'baseurl'         => 'http://archive.zfsonlinux.org/epel/6/SRPMS/',
      'enabled'         => '0',
      'metadata_expire' => '604800',
      'gpgcheck'        => '1',
      'gpgkey'          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
      'priority'        => '1',
    })
  end


  context 'with zfs_baseurl => http://foo.bar/zfs' do
    let(:pre_condition) { "class { 'zfsonlinux': zfs_baseurl => 'http://foo.bar/zfs' }" }

    it { should contain_yumrepo('zfs').with_baseurl('http://foo.bar/zfs') }
  end
  
  context 'with zfs_source_baseurl => http://foo.bar/zfs/SRPMS' do
    let(:pre_condition) { "class { 'zfsonlinux': zfs_source_baseurl => 'http://foo.bar/zfs/SRPMS' }" }

    it { should contain_yumrepo('zfs-source').with_baseurl('http://foo.bar/zfs/SRPMS') }
  end
end
