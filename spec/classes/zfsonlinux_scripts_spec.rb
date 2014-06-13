require 'spec_helper'

describe 'zfsonlinux::scripts' do
  include_context :defaults
  
  let(:facts) { default_facts }

  it { should create_class('zfsonlinux::scripts') }
  it { should contain_class('zfsonlinux::params') }

  it do
    should contain_file('/usr/local/sbin/mk_vdev_alias.rb').with({
      'ensure'  => 'present',
      'source'  => 'puppet:///modules/zfsonlinux/mk_vdev_alias.rb',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0755',
    })
  end 
end
