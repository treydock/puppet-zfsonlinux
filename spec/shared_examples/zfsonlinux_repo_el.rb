shared_examples_for 'zfsonlinux::repo::el' do |facts|
  it { should create_class('zfsonlinux::repo::el') }
  it { should contain_class('zfsonlinux') }

  it do
    should contain_exec('RPM-GPG-KEY-zfsonlinux').with({
      :path     => '/usr/bin:/bin:/usr/sbin:/sbin',
      :command  => "wget -qO- http://archive.zfsonlinux.org/epel/zfs-release.el#{facts[:operatingsystemmajrelease]}.noarch.rpm | rpm2cpio - | cpio -i --quiet --to-stdout ./etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux > /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux",
      :creates  => '/etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux',
      :before   => ['Yumrepo[zfs]', 'Yumrepo[zfs-source]', 'Yumrepo[zfs-testing]', 'Yumrepo[zfs-testing-source]'],
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

  it do
    should contain_yum__versionlock("0:zfs-0.6.5.3-1.el#{facts[:operatingsystemmajrelease]}.*").with({
      :ensure => 'present',
    })
  end

  context 'when zol_version => 0.6.5.2' do
    let(:facts) { facts.merge({:zol_version => '0.6.5.2'}) }

    it do
      should contain_yum__versionlock("0:zfs-0.6.5.2-1.el#{facts[:operatingsystemmajrelease]}.*")
    end
  end

  context 'when zol_version => 0.6.5.2 and version => 0.6.5.4' do
    let(:params) {{ :version => '0.6.5.4' }}
    let(:facts) { facts.merge({:zol_version => '0.6.5.2'}) }

    it do
      should contain_yum__versionlock("0:zfs-0.6.5.4-1.el#{facts[:operatingsystemmajrelease]}.*")
    end
  end

  context 'when version => 0.6.5.4' do
    let(:params) {{ :version => '0.6.5.4' }}

    it do
      should contain_yum__versionlock("0:zfs-0.6.5.4-1.el#{facts[:operatingsystemmajrelease]}.*")
    end
  end

  context 'with baseurl => http://foo.bar/zfs' do
    let(:params) {{ :baseurl => 'http://foo.bar/zfs' }}

    it { should contain_yumrepo('zfs').with_baseurl('http://foo.bar/zfs') }
  end

  context 'with testing_baseurl => http://foo.bar/zfs-testing' do
    let(:params) {{ :testing_baseurl => 'http://foo.bar/zfs-testing' }}

    it { should contain_yumrepo('zfs-testing').with_baseurl('http://foo.bar/zfs-testing') }
  end

  context 'with source_baseurl => http://foo.bar/zfs/SRPMS' do
    let(:params) {{ :source_baseurl => 'http://foo.bar/zfs/SRPMS' }}

    it { should contain_yumrepo('zfs-source').with_baseurl('http://foo.bar/zfs/SRPMS') }
  end

  context 'with testing_source_baseurl => http://foo.bar/zfs-testing/SRPMS' do
    let(:params) {{ :testing_source_baseurl => 'http://foo.bar/zfs-testing/SRPMS' }}

    it { should contain_yumrepo('zfs-testing-source').with_baseurl('http://foo.bar/zfs-testing/SRPMS') }
  end
end
