require 'spec_helper'

describe 'zfsonlinux' do
  include_context :defaults
  
  let(:facts) { default_facts }
  
  it { should create_class('zfsonlinux') }
  it { should contain_class('zfsonlinux::params') }

  it { should contain_anchor('zfsonlinux::begin').that_comes_before('Class[zfsonlinux::repo::el]') }
  it { should contain_class('zfsonlinux::repo::el').that_comes_before('Yumrepo[epel]') }
  it { should contain_yumrepo('epel').that_comes_before('Class[zfsonlinux::install]') }
  it { should contain_class('zfsonlinux::install').that_comes_before('Class[zfsonlinux::config]') }
  it { should contain_class('zfsonlinux::config').that_comes_before('Class[zfsonlinux::zed]') }
  it { should contain_class('zfsonlinux::zed').that_comes_before('Class[zfsonlinux::service]') }
  it { should contain_class('zfsonlinux::service').that_comes_before('Anchor[zfsonlinux::end]') }
  it { should contain_anchor('zfsonlinux::end') }

  it_behaves_like 'zfsonlinux::repo::el'

  context 'zfsonlinux::install' do
    it do
      should contain_package('zfs').with({
        :ensure  => 'installed',
        :name    => 'zfs',
      })
    end
  end

  context 'zfsonlinux::config' do
    it do
      should contain_file('/etc/modprobe.d/zfs.conf').with({
        :ensure  => 'file',
        :owner   => 'root',
        :group   => 'root',
        :mode    => '0644',
      }) \
      .with_content(/^$/)
    end

    context "tunables => {'zfs_arc_max' => '0', 'zfs_arc_min' => '0'}" do
      let(:params){{ :tunables => {'zfs_arc_max' => '0', 'zfs_arc_min' => '0'} }}

      it do
        should contain_file('/etc/modprobe.d/zfs.conf') \
        .with_content(/^options zfs zfs_arc_max=0 zfs_arc_min=0 $/)
      end
    end
  end

  context 'zfsonlinux::zed' do
    it { should have_shellvar_resource_count(10) }

    [
      { :name => 'ZED_DEBUG_LOG', :ensure => 'present', :value => '/tmp/zed.debug.log' },
      { :name => 'ZED_EMAIL', :ensure => 'absent', :value => 'UNSET' },
      { :name => 'ZED_EMAIL_VERBOSE', :ensure => 'present', :value => '0' },
      { :name => 'ZED_EMAIL_INTERVAL_SECS', :ensure => 'present', :value => '3600' },
      { :name => 'ZED_LOCKDIR', :ensure => 'present', :value => '/var/lock' },
      { :name => 'ZED_RUNDIR', :ensure => 'present', :value => '/var/run' },
      { :name => 'ZED_SYSLOG_PRIORITY', :ensure => 'present', :value => 'daemon.notice' },
      { :name => 'ZED_SYSLOG_TAG', :ensure => 'present', :value => 'zed' },
      { :name => 'ZED_SPARE_ON_IO_ERRORS', :ensure => 'present', :value => '0' },
      { :name => 'ZED_SPARE_ON_CHECKSUM_ERRORS', :ensure => 'present', :value => '0' },
    ].each do |h|
      it do
        should contain_shellvar(h[:name]).with({
          :ensure => h[:ensure],
          :target => '/etc/zfs/zed.d/zed.rc',
          :value  => h[:value],
        })
      end
    end

    context 'when manage_zed => false' do
      let(:params) {{ :manage_zed => false }}

      it { should have_shellvar_resource_count(0) }
    end
  end

  context 'zfsonlinux::service' do
    it do
      should contain_service('zfs').with({
        :ensure      => 'running',
        :enable      => 'true',
        :hasstatus   => 'false',
        :hasrestart  => 'true',
        :status      => 'lsmod | egrep -q "^zfs"',
        :name        => 'zfs',
      })
    end
  end

  context "operatingsystemmajrelease => 5" do
    let(:facts) { default_facts.merge({ :operatingsystemmajrelease => "5" }) }
    it { expect { should contain_class('zfsonlinux::params') }.to raise_error(Puppet::Error, /Unsupported operatingsystemmajrelease: 5/) }
  end

  # Test validate_bool parameters
  [
    'manage_zed',
  ].each do |param|
    context "with #{param} => 'foo'" do
      let(:params) {{ param => 'foo' }}
      it { expect { should create_class('zfsonlinux') }.to raise_error(Puppet::Error, /is not a boolean/) }
    end
  end

  # Test validate_hash parameters
  [
    'tunables',
  ].each do |param|
    context "with #{param} => 'foo'" do
      let(:params) {{ param.to_sym => 'foo' }}
      it { expect { should create_class('zfsonlinux') }.to raise_error(Puppet::Error, /is not a Hash/) }
    end
  end

end
