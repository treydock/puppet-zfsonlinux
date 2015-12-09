require 'spec_helper_acceptance'

describe 'zpool_version fact:' do
  if default['hypervisor'] !~ /docker/
    describe command("facter --puppet zpool_version") do
      it { should return_stdout /\d+/ }
      it { should return_exit_status 0 }
    end
  end
end
