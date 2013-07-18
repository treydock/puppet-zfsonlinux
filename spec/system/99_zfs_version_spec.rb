require 'spec_helper_system'

describe 'zfs_version fact:' do
   context "should return valid zfs version" do
    context shell "facter -p zfs_version" do
      its(:exit_code) { should be_zero }
      its(:stdout) { should =~ /\d+/ }
      its(:stderr) { should be_empty }
    end
  end
end
