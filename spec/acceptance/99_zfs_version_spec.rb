require 'spec_helper_acceptance'

describe 'zfs_version fact:' do
  describe command("facter --puppet zfs_version") do
    it { should return_stdout /\d+/ }
    it { should return_exit_status 0 }
  end
end
