require 'spec_helper'

describe 'zfsonlinux' do

  package_dependencies = [
    'kernel-devel',
    'gcc',
    'make',
    'perl',
  ]

  let(:facts) do
    {
      :osfamily         => 'RedHat',
      :operatingsystem  => 'CentOS',
    }
  end
  
  it { should contain_class('zfsonlinux::params') }
  it { should contain_class('zfsonlinux::repo') }
  it { should contain_class('zfsonlinux::repo::el') }    
  it { should_not contain_class('zfsonlinux::repo::sl') }    
  
  package_dependencies.each do |package_dependency|
    it { should contain_package(package_dependency).with({ 'ensure' => 'present' }) }
  end
  
  it do
    should contain_package('zfs-release').with({
      'ensure'    => 'installed',
      'source'    => 'http://archive.zfsonlinux.org/epel/zfs-release-1-2.el6.noarch.rpm',
      'provider'  => 'rpm',
    })
  end
  
  it do
    should contain_package('zfs').with({
      'ensure'  => 'installed',
  	  'name'    => 'zfs',
  	  'require' => 'Class[Zfsonlinux::Repo]',
    })
  end
  
  it do
    should contain_service('zfs').with({
      'ensure'  => nil,
  	  'enable'  => 'true',
  	  'name'    => 'zfs',
  	  'require' => 'Package[zfs]',
    })
  end
  
  context 'Scientific Linux' do
    let(:facts) do
      {
        :osfamily         => 'RedHat',
        :operatingsystem  => 'Scientific',
      }
    end
    
    it { should contain_class('zfsonlinux::repo::sl') }    
    it { should_not contain_class('zfsonlinux::repo::el') }
    
    it { should_not contain_package('zfs-release') }
    
    it do
      should contain_yumrepo('sl-addons').with({
        'enabled' => '1',
      })
    end
  end
end