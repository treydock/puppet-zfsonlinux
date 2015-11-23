shared_examples_for 'zfsonlinux::service' do |facts|

  it do
    should contain_service('zfs-import').with({
      :ensure => 'running',
      :enable => 'true',
    })
  end

  it do
    should contain_service('zfs-mount').with({
      :ensure => 'running',
      :enable => 'true',
    })
  end

  it do
    should contain_service('zfs-share').with({
      :ensure => 'running',
      :enable => 'true',
    })
  end

  it do
    should contain_service('zfs-zed').with({
      :ensure => 'running',
      :enable => 'true',
    })
  end

  context 'when enable_import_service => false' do
    let(:params) {{ :enable_import_service => false }}
    it do
      should contain_service('zfs-import').with({
        :ensure => nil,
        :enable => 'false',
      })
    end
  end

  context 'when enable_mount_service => false' do
    let(:params) {{ :enable_mount_service => false }}
    it do
      should contain_service('zfs-mount').with({
        :ensure => nil,
        :enable => 'false',
      })
    end
  end

  context 'when enable_share_service => false' do
    let(:params) {{ :enable_share_service => false }}
    it do
      should contain_service('zfs-share').with({
        :ensure => nil,
        :enable => 'false',
      })
    end
  end

  context 'when enable_zed => false' do
    let(:params) {{ :enable_zed => false }}
    it do
      should contain_service('zfs-zed').with({
        :ensure => 'stopped',
        :enable => 'false',
      })
    end
  end

  shared_context 'zfsonlinux::service < 0.6.5' do
    it do
      should contain_service('zfs').with({
        :ensure      => 'running',
        :enable      => 'true',
        :hasstatus   => 'false',
        :hasrestart  => 'true',
        :status      => 'lsmod | egrep -q "^zfs"',
        :name        => 'zfs',
      })
    end

    it do
      should contain_file_line('enable zed').with({
        :ensure => 'present',
        :path   => '/etc/rc.local',
        :line   => '/sbin/zed',
        :after  => 'touch /var/lock/subsys/local',
      })
    end

    it do
      should contain_service('zed').with({
        :ensure   => 'running',
        :binary   => 'zed',
        :provider => 'base',
      })
    end
  end

  context 'when version => 0.6.4.2' do
    let(:params) {{ :version => '0.6.4.2' }}

    include_context 'zfsonlinux::service < 0.6.5'

    context 'when manage_zed => false' do
      let(:params) {{ :version => '0.6.4.2', :manage_zed => false }}
      it { should_not contain_file_line('enable zed') }
      it { should_not contain_service('zed') }
    end

    context 'when enable_zed => false' do
      let(:params) {{ :version => '0.6.4.2', :enable_zed => false }}
      it { should contain_file_line('enable zed').with_ensure('absent') }
      it { should contain_service('zed').with_ensure('stopped') }
    end

    context 'when manage_zed_service => false' do
      let(:params) {{ :version => '0.6.4.2', :manage_zed_service => false }}
      it { should contain_file_line('enable zed').with_ensure('absent') }
      it { should_not contain_service('zed') }
    end
  end

  context 'when version => 0.6.4.2' do
    let(:facts) { facts.merge({:zol_version => '0.6.4.2' }) }
    include_context 'zfsonlinux::service < 0.6.5'
  end
end
