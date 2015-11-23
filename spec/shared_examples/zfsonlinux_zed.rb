shared_examples_for 'zfsonlinux::zed' do |facts|
  defaults = {
    'ZED_DEBUG_LOG' => '/tmp/zed.debug.log',
    'ZED_LOCKDIR' => '/var/lock',
    'ZED_RUNDIR' => '/var/run',
    'ZED_SYSLOG_PRIORITY' => 'daemon.notice',
    'ZED_SYSLOG_TAG' => 'zed',
    'ZED_SPARE_ON_IO_ERRORS' => '0',
    'ZED_SPARE_ON_CHECKSUM_ERRORS' => '0',
  }
  defaults_065 = {
    'ZED_EMAIL_PROG' => 'mail',
    'ZED_NOTIFY_INTERVAL_SECS' => '3600',
    'ZED_NOTIFY_VERBOSE' => '0',
  }
  defaults_064 = {
    'ZED_EMAIL_INTERVAL_SECS' => '3600',
    'ZED_EMAIL_VERBOSE' => '0',
  }

  defaults.merge(defaults_065).each_pair do |key,value|
    it do
      should contain_shellvar(key).with({
        :ensure => 'present',
        :target => '/etc/zfs/zed.d/zed.rc',
        :value  => value,
        :notify => 'Service[zfs-zed]'
      })
    end
  end

  shared_context 'zfsonlinux::zed < 0.6.5' do
    defaults.merge(defaults_064).each_pair do |key,value|
      it do
        should contain_shellvar(key).with({
          :ensure => 'present',
          :target => '/etc/zfs/zed.d/zed.rc',
          :value  => value,
          :notify => 'Service[zed]'
        })
      end
    end
  end

  context 'when zed_email => root' do
    let(:params) {{ :zed_email => 'root' }}
    it do
      should contain_shellvar('ZED_EMAIL_ADDR').with({
        :ensure => 'present',
        :target => '/etc/zfs/zed.d/zed.rc',
        :value  => 'root',
        :notify => 'Service[zfs-zed]'
      })
    end
  end

  context 'when version => 0.6.4.2' do
    let(:params) {{ :version => '0.6.4.2' }}
    include_context 'zfsonlinux::zed < 0.6.5'

    context 'when zed_email => root' do
      let(:params) {{ :version => '0.6.4.2', :zed_email => 'root' }}
      it do
        should contain_shellvar('ZED_EMAIL').with({
          :ensure => 'present',
          :target => '/etc/zfs/zed.d/zed.rc',
          :value  => 'root',
          :notify => 'Service[zed]'
        })
      end
    end
  end

  context 'when version => 0.6.4.2' do
    let(:facts) { facts.merge({:zol_version => '0.6.4.2' }) }
    include_context 'zfsonlinux::zed < 0.6.5'

    context 'when zed_email => root' do
      let(:params) {{ :zed_email => 'root' }}
      it do
        should contain_shellvar('ZED_EMAIL').with({
          :ensure => 'present',
          :target => '/etc/zfs/zed.d/zed.rc',
          :value  => 'root',
          :notify => 'Service[zed]'
        })
      end
    end
  end
end
