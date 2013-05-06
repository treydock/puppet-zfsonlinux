require 'spec_helper'

describe 'zfsonlinux' do

  shared_context :shared_zfsonlinux_context do
    it { should contain_class('zfsonlinux::params') }
    it { should contain_class('zfsonlinux::repo') }

    it { should contain_package('kernel-devel').with({ 'ensure' => 'present' }) }
    it { should contain_package('gcc').with({ 'ensure' => 'present' }) }
    it { should contain_package('make').with({ 'ensure' => 'present' }) }
    it { should contain_package('perl').with({ 'ensure' => 'present' }) }

    it do
      should contain_package('zfs').with({
        'ensure'  => 'installed',
    	  'name'    => 'zfs',
    	  'require' => 'Class[Zfsonlinux::Repo]',
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

  
  context 'Enterprise Linux' do
    it_behaves_like :shared_zfsonlinux_context

    let(:facts) do
      {
        :osfamily         => 'RedHat',
        :operatingsystem  => 'CentOS',
      }
    end

    it { should contain_class('zfsonlinux::repo::el') }    
    it { should_not contain_class('zfsonlinux::repo::sl') }
  
    it do
      should contain_package('zfs-release').with({
        'ensure'    => 'installed',
        'source'    => 'http://archive.zfsonlinux.org/epel/zfs-release-1-2.el6.noarch.rpm',
        'provider'  => 'rpm',
      })
    end
  end
  
  context 'Scientific Linux' do
    it_behaves_like :shared_zfsonlinux_context

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