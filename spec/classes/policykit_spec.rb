require 'spec_helper'

describe 'policykit', :type => :class do

  describe 'for osfamily RedHat' do
    it { should contain_class('policykit') }
  end

end
