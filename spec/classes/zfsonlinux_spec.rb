require 'spec_helper'

describe 'zfsonlinux' do
  include_context :defaults
  
  let(:facts) { default_facts }
  
  it { should create_class('zfsonlinux') }
  it { should contain_class('zfsonlinux::params') }
  it { should contain_class('zfsonlinux::repo') }
  it { should_not contain_class('zfsonlinux::scripts') }

  it { should contain_package('kernel-devel').with({ 'ensure' => 'present' }) }
  it { should contain_package('gcc').with({ 'ensure' => 'present' }) }
  it { should contain_package('make').with({ 'ensure' => 'present' }) }
  it { should contain_package('perl').with({ 'ensure' => 'present' }) }

  it do
    should contain_package('zfs').with({
      'ensure'  => 'installed',
      'name'    => 'zfs',
      'require' => ['Yumrepo[zfs]', 'Package[kernel-devel]', 'Package[gcc]', 'Package[make]', 'Package[perl]'],
    })
  end

  it do
    should contain_service('zfs').with({
      'ensure'      => 'running',
      'enable'      => 'true',
      'hasstatus'   => 'false',
      'hasrestart'  => 'true',
      'status'      => 'lsmod | egrep -q "^zfs"',
      'name'        => 'zfs',
      'require'     => 'Package[zfs]',
    })
  end
  
  it do
    should contain_file('/etc/modprobe.d/zfs.conf').with({
      'ensure'  => 'present',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'before'  => 'Service[zfs]',
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

  context "tunables => foo" do
    let(:params){{ :tunables => 'foo' }}
    it { expect { should contain_file('/etc/modprobe.d/zfs.conf') }.to raise_error(Puppet::Error, /is not a Hash/) }
  end
  
  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => "5.9" }) }
    it { expect { should contain_class('zfsonlinux::params') }.to raise_error(Puppet::Error, /Unsupported operatingsystemrelease: 5.9/) }
  end
  
  context 'include_scripts => true' do
    let(:params) {{ :include_scripts => true }}
    it { should contain_class('zfsonlinux::scripts') }
  end

  context "include_scripts => 'true'" do
    let(:params) {{ :include_scripts => 'true' }}
    it { expect { should contain_class('zfsonlinux::scripts') }.to raise_error(Puppet::Error, /is not a boolean/) }
  end
end
