require 'spec_helper'

describe 'policykit::params', :type => :class do
  describe 'for osfamily RedHat' do
    let :facts do
      {
        :osfamily => 'RedHat',
      }
    end

    describe 'el6.x' do
      before { facts[:lsbmajdistrelease] = '6' }
  
      it { should include_class('policykit::params') }
    end

    describe 'unsupported lsbmajdistrelease' do
      before { facts[:lsbmajdistrelease] = '7' }

      it 'should fail' do
        expect { should include_class('policykit::params') }.
          to raise_error(Puppet::Error, /not supported on lsbmajdistrelease 7/)
      end
    end
  end

  describe 'unsupported osfamily' do
    let :facts do 
      {
        :osfamily        => 'Debian',
        :operatingsystem => 'Debian',
      }
    end
  
    it 'should fail' do
      expect { should include_class('policykit::params') }.
        to raise_error(Puppet::Error, /not supported on Debian/)
    end
  end

end
