require 'spec_helper'

describe 'zfsonlinux::monitor' do
  include_context :defaults

  let(:facts) { default_facts }

  let(:params) {{ :monitor_tool => 'zabbix', }}

  it { should create_class('zfsonlinux::monitor') }
  it { should contain_class('zfsonlinux::params') }
  it { should include_class('zfsonlinux::monitor::sudo') }
  it { should include_class('zfsonlinux::monitor::zabbix') }
  it { should include_class('zfsonlinux::arcstat') }

  context "monitor_tool => 'foo'" do
    let(:params) {{ :monitor_tool => 'foo' }}

    it do
      expect {
        should include_class('zfsonlinux::monitor::foo')
      }.to raise_error(Puppet::Error, /does not match/)
    end
  end

  context "manage_sudo => false" do
    let(:params) {{ :monitor_tool => 'zabbix', :manage_sudo => false }}
    
    it { should_not include_class('zfsonlinux::monitor::sudo') }
  end
  
  context "manage_sudo => 'false'" do
    let(:params) {{ :monitor_tool => 'zabbix', :manage_sudo => 'false' }}

    it do
      expect {
        should include_class('zfsonlinux::monitor::sudo')
      }.to raise_error(Puppet::Error, /is not a boolean/)
    end
  end

  context 'include_arcstat => false' do
    let(:params) {{ :monitor_tool => 'zabbix', :include_arcstat => false }}
    
    it { should_not include_class('zfsonlinux::arcstat') }
  end

  context "include_arcstat => 'true'" do
    let(:params) {{ :monitor_tool => 'zabbix', :include_arcstat => 'true' }}
    
    it { expect { should include_class('zfsonlinux::arcstat') }.to raise_error(Puppet::Error, /is not a boolean/) }
  end
end
