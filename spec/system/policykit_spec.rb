require 'spec_helper_system'

describe 'policykit class' do
  case node.facts['osfamily']
  when 'RedHat'
    package_name = 'polkit'
  when 'Debian'
    package_name = 'policykit-1'
  end

  describe 'running puppet code' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
        include policykit
      EOS

      # Run it twice and test for idempotency
      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end
  end

  describe package(package_name) do
    it { should be_installed }
  end

  describe file('/etc/polkit-1/localauthority/50-local.d') do
    it { should be_directory }
  end
end
