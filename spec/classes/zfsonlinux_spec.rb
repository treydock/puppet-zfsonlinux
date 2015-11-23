require 'spec_helper'

describe 'zfsonlinux' do
  on_supported_os({
    :supported_os => [
      {
        'operatingsystem' => 'CentOS',
        'operatingsystemrelease' => ['6', '7'],
      }
    ]
  }).each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :memorysize_mb => 100,
        })
      end

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

      it_behaves_like 'zfsonlinux::repo::el', facts
      it_behaves_like 'zfsonlinux::install', facts
      it_behaves_like 'zfsonlinux::config', facts
      it_behaves_like 'zfsonlinux::zed', facts
      it_behaves_like 'zfsonlinux::service', facts

      context "operatingsystemmajrelease => 5" do
        let :facts do
          {
            :osfamily                   => 'RedHat',
            :operatingsystemmajrelease  => '5',
            :architecture               => 'x86_64',
          }
        end

        it { expect { should contain_class('zfsonlinux::params') }.to raise_error(Puppet::Error, /Unsupported operatingsystemmajrelease: 5/) }
      end

      # Test validate_bool parameters
      [
        'manage_zed',
        'enable_zed',
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
  end
end
