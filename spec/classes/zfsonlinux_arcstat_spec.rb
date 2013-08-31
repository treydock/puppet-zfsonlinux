require 'spec_helper'

describe 'zfsonlinux::arcstat' do
  include_context :defaults
  
  let(:facts) { default_facts }

  it { should create_class('zfsonlinux::arcstat') }
  it { should include_class('zfsonlinux::params') }

  it do
    should contain_file('/usr/bin/arcstat.py').with({
      'ensure'  => 'present',
      'path'    => '/usr/bin/arcstat.py',
      'source'  => 'puppet:///modules/zfsonlinux/arcstat.py',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0755',
    })
  end
end
