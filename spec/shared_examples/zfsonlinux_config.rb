shared_examples_for 'zfsonlinux::config' do |facts|
  it do
    should contain_file('/etc/modprobe.d/zfs.conf').with({
      :ensure  => 'file',
      :owner   => 'root',
      :group   => 'root',
      :mode    => '0644',
    }) \
    .with_content(/^$/)
  end

  context "tunables => {'zfs_arc_max' => '0', 'zfs_arc_min' => '0'}" do
    let(:params){{ :tunables => {'zfs_arc_max' => '0', 'zfs_arc_min' => '0'} }}

    it do
      should contain_file('/etc/modprobe.d/zfs.conf') \
      .with_content(/^options zfs zfs_arc_max=0 zfs_arc_min=0 $/)
    end

    context "zfs_arc_max_percent => 20" do
      let(:params) {{ :tunables => {'zfs_arc_max' => '0', 'zfs_arc_min' => '0'}, :zfs_arc_max_percent => '20' }}

      it do
        should contain_file('/etc/modprobe.d/zfs.conf') \
        .with_content(/^options zfs zfs_arc_max=0 zfs_arc_min=0 $/)
      end
    end
  end

  context "tunables => {'zfs_arc_min' => '0'} and zfs_arc_max_percent => 20" do
    let(:params) {{ :tunables => {'zfs_arc_min' => '0'}, :zfs_arc_max_percent => '20' }}

    it do
      should contain_file('/etc/modprobe.d/zfs.conf') \
      .with_content(/^options zfs zfs_arc_max=#{20 * 1024**2} zfs_arc_min=0 $/)
    end
  end

  context "zfs_arc_max_percent => 20" do
    let(:params) {{ :zfs_arc_max_percent => '20' }}

    it do
      should contain_file('/etc/modprobe.d/zfs.conf') \
      .with_content(/^options zfs zfs_arc_max=#{20 * 1024**2} $/)
    end
  end

  context 'when service_configs defined' do
    let(:params) do
      {
        :service_configs => {
          'ZFS_SHARE' => { 'value' => 'no' }
        }
      }
    end

    it do
      should contain_shellvar('ZFS_SHARE').with({
        :ensure => 'present',
        :target => '/etc/sysconfig/zfs',
        :value  => 'no',
      })
    end

    context 'when version => 0.6.4.2' do
      let(:params) do
        {
          :version => '0.6.4.2',
          :service_configs => {
            'ZFS_SHARE' => { 'value' => 'no' }
          }
        }
      end

      it { should_not contain_shellvar('ZFS_SHARE') }
    end
  end
end
