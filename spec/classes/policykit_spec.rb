require 'spec_helper'

describe 'policykit', :type => :class do

  describe 'for osfamily RedHat' do
    let :facts do
      {
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '6',
      }
    end

    it { should contain_class('policykit') }
    it { should contain_package('polkit') }
  end

end
