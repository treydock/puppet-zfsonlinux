shared_examples 'zfsonlinux::install' do |facts|
  it do
    should contain_package('zfs').with({
      :ensure  => "0.6.5.3-1.el#{facts[:operatingsystemmajrelease]}",
      :name    => 'zfs',
    })
  end

  context 'when zol_version => 0.6.5.2' do
    let(:facts) { facts.merge({:zol_version => '0.6.5.2'}) }

    it do
      should contain_package('zfs').with_ensure('present')
    end
  end

  context 'when zol_version => 0.6.5.2 and version => 0.6.5.4' do
    let(:params) {{ :version => '0.6.5.4' }}
    let(:facts) { facts.merge({:zol_version => '0.6.5.2'}) }

    it do
      should contain_package('zfs').with_ensure('present')
    end
  end

  context 'when version => 0.6.5.4' do
    let(:params) {{ :version => '0.6.5.4' }}

    it do
      should contain_package('zfs').with_ensure("0.6.5.4-1.el#{facts[:operatingsystemmajrelease]}")
    end
  end
end
