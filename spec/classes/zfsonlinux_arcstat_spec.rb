require 'spec_helper'

describe 'zfsonlinux::arcstat' do
  include_context :defaults
  
  let(:facts) { default_facts }

  it { should create_class('zfsonlinux::arcstat') }
  it { should include_class('zfsonlinux::params') }

  it do
    should contain_package('perl-Sun-Solaris-Kstat').with({
      'ensure'    => 'installed',
      'source'    => 'http://yum.tamu.edu/zfsonlinux/epel/6/x86_64/perl-Sun-Solaris-Kstat-0.01-1.el6.noarch.rpm',
      'provider'  => 'rpm',
      'before'    => 'Package[zfs-arcstat]',
    })
  end

  it do
    should contain_package('zfs-arcstat').with({
      'ensure'    => 'installed',
      'source'    => 'http://yum.tamu.edu/zfsonlinux/epel/6/x86_64/zfs-arcstat-0.5-1.el6.noarch.rpm',
      'provider'  => 'rpm',
    })
  end 
end
