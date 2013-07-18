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
end
