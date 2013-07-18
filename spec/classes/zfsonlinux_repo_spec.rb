require 'spec_helper'

describe 'zfsonlinux::repo' do
  include_context :defaults
  
  let(:facts) { default_facts }

  it { should create_class('zfsonlinux::repo') }

  context 'osfamily => RedHat' do
    it { should include_class('zfsonlinux::repo::el') }   
  end
end
