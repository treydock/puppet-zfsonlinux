require 'spec_helper'

describe 'zfsonlinux' do
  include_context :defaults
  
  let(:facts) { default_facts }
  
  it { should create_class('zfsonlinux') }
  it { should contain_class('zfsonlinux::params') }
  it { should include_class('zfsonlinux::repo') }

  it { should contain_package('kernel-devel').with({ 'ensure' => 'present' }) }
  it { should contain_package('gcc').with({ 'ensure' => 'present' }) }
  it { should contain_package('make').with({ 'ensure' => 'present' }) }
  it { should contain_package('perl').with({ 'ensure' => 'present' }) }

  it do
    should contain_package('zfs').with({
      'ensure'  => 'installed',
  	  'name'    => 'zfs',
  	  'require' => 'Yumrepo[zfs]',
    })
  end

  it do
    should contain_service('zfs').with({
      'ensure'      => 'running',
  	  'enable'      => 'true',
      'hasstatus'   => 'true',
      'hasrestart'  => 'true',
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
    let(:params){{ :tunables =>  {'zfs_arc_max' => '0', 'zfs_arc_min' => '0'} }}
    
    it do
      should contain_file('/etc/modprobe.d/zfs.conf') \
      .with_content(/^options zfs zfs_arc_max=0 zfs_arc_min=0 $/)
    end
  end
end
