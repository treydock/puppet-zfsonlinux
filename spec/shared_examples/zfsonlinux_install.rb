shared_examples 'zfsonlinux::install' do |facts|
  it { should contain_class('epel') }

  it do
    should contain_package('zfs').with({
      :ensure   => "0.6.5.3-1.el#{facts[:operatingsystemmajrelease]}",
      :name     => 'zfs',
      :require  => 'Yumrepo[epel]',
    })
  end

  it { should_not contain_package('libzfs2-devel') }

  context 'when install_devel_package => true' do
    let(:params) {{ :install_devel_package => true }}
    it { should contain_package('libzfs2-devel').with_ensure("0.6.5.3-1.el#{facts[:operatingsystemmajrelease]}")}
  end

  context 'when zol_version => 0.6.5.2' do
    let(:facts) { facts.merge({:zol_version => '0.6.5.2'}) }

    it do
      should contain_package('zfs').with_ensure('present')
    end

    context 'when install_devel_package => true' do
      let(:params) {{ :install_devel_package => true }}
      it { should contain_package('libzfs2-devel').with_ensure("0.6.5.2-1.el#{facts[:operatingsystemmajrelease]}")}
    end
  end

  context 'when zol_version => 0.6.5.2 and version => 0.6.5.4' do
    let(:params) {{ :version => '0.6.5.4' }}
    let(:facts) { facts.merge({:zol_version => '0.6.5.2'}) }

    it do
      should contain_package('zfs').with_ensure('present')
    end

    context 'when install_devel_package => true' do
      let(:params) {{ :version => '0.6.5.4', :install_devel_package => true }}
      it { should contain_package('libzfs2-devel').with_ensure("0.6.5.2-1.el#{facts[:operatingsystemmajrelease]}")}
    end
  end

  context 'when version => 0.6.5.4' do
    let(:params) {{ :version => '0.6.5.4' }}

    it do
      should contain_package('zfs').with_ensure("0.6.5.4-1.el#{facts[:operatingsystemmajrelease]}")
    end

    context 'when install_devel_package => true' do
      let(:params) {{ :version => '0.6.5.4', :install_devel_package => true }}
      it { should contain_package('libzfs2-devel').with_ensure("0.6.5.4-1.el#{facts[:operatingsystemmajrelease]}")}
    end
  end
end
