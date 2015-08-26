require 'spec_helper'

shared_examples_for 'zfsonlinux::repo::el' do
  it { should create_class('zfsonlinux::repo::el') }
  it { should contain_class('zfsonlinux') }

  it do
    should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux').with({
      :ensure  => 'file',
      :source  => 'puppet:///modules/zfsonlinux/RPM-GPG-KEY-zfsonlinux',
      :owner   => 'root',
      :group   => 'root',
      :mode    => '0644',
    })
  end

  it do
    should contain_gpg_key('zfsonlinux').with({
      :path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
      :before  => ['Yumrepo[zfs]', 'Yumrepo[zfs-source]', 'Yumrepo[zfs-testing]', 'Yumrepo[zfs-testing-source]'],
    })
  end

  it do
    should contain_yumrepo('zfs').only_with({
      :name             => 'zfs',
      :descr            => "ZFS on Linux for EL #{facts[:operatingsystemmajrelease]}",
      :baseurl          => "http://archive.zfsonlinux.org/epel/#{facts[:operatingsystemmajrelease]}/x86_64/",
      :enabled          => '1',
      :metadata_expire  => '7d',
      :gpgcheck         => '1',
      :gpgkey           => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    })
  end

  it do
    should contain_yumrepo('zfs-source').only_with({
      :name             => 'zfs-source',
      :descr            => "ZFS on Linux for EL #{facts[:operatingsystemmajrelease]} - Source",
      :baseurl          => "http://archive.zfsonlinux.org/epel/#{facts[:operatingsystemmajrelease]}/SRPMS/",
      :enabled          => '0',
      :gpgcheck         => '1',
      :gpgkey           => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    })
  end

  it do
    should contain_yumrepo('zfs-testing').only_with({
      :name             => 'zfs-testing',
      :descr            => "ZFS on Linux for EL #{facts[:operatingsystemmajrelease]} - Testing",
      :baseurl          => "http://archive.zfsonlinux.org/epel-testing/#{facts[:operatingsystemmajrelease]}/x86_64/",
      :enabled          => '0',
      :metadata_expire  => '7d',
      :gpgcheck         => '1',
      :gpgkey           => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    })
  end

  it do
    should contain_yumrepo('zfs-testing-source').only_with({
      :name             => 'zfs-testing-source',
      :descr            => "ZFS on Linux for EL #{facts[:operatingsystemmajrelease]} - Testing Source",
      :baseurl          => "http://archive.zfsonlinux.org/epel-testing/#{facts[:operatingsystemmajrelease]}/SRPMS/",
      :enabled          => '0',
      :gpgcheck         => '1',
      :gpgkey           => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
    })
  end

  context 'with baseurl => http://foo.bar/zfs' do
    let(:pre_condition) { "class { 'zfsonlinux': baseurl => 'http://foo.bar/zfs' }" }

    it { should contain_yumrepo('zfs').with_baseurl('http://foo.bar/zfs') }
  end

  context 'with testing_baseurl => http://foo.bar/zfs-testing' do
    let(:pre_condition) { "class { 'zfsonlinux': testing_baseurl => 'http://foo.bar/zfs-testing' }" }

    it { should contain_yumrepo('zfs-testing').with_baseurl('http://foo.bar/zfs-testing') }
  end

  context 'with source_baseurl => http://foo.bar/zfs/SRPMS' do
    let(:pre_condition) { "class { 'zfsonlinux': source_baseurl => 'http://foo.bar/zfs/SRPMS' }" }

    it { should contain_yumrepo('zfs-source').with_baseurl('http://foo.bar/zfs/SRPMS') }
  end

  context 'with testing_source_baseurl => http://foo.bar/zfs-testing/SRPMS' do
    let(:pre_condition) { "class { 'zfsonlinux': testing_source_baseurl => 'http://foo.bar/zfs-testing/SRPMS' }" }

    it { should contain_yumrepo('zfs-testing-source').with_baseurl('http://foo.bar/zfs-testing/SRPMS') }
  end
end
