require 'spec_helper_system'

describe 'policykit::localauthority define' do
  describe 'running puppet code' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
        policykit::localauthority { 'disable suspend':
           identity        => 'unix-user:*',
           action          => 'org.freedesktop.upower.suspend',
           result_active   => 'no',
           result_any      => 'no',
           result_inactive => 'no',
        }
      EOS

      # Run it twice and test for idempotency
      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end
  end

  describe file('/etc/polkit-1/localauthority/50-local.d/disable_suspend.pkla') do
    it { should be_file }
  end
end
