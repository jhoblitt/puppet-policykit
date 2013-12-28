require 'spec_helper'

describe 'policykit::params', :type => :class do
  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    describe 'el6.x' do
      before { facts[:operatingsystemmajrelease] = '6' }
  
      it { should contain_class('policykit::params') }
    end

    describe 'unsupported lsbmajdistrelease' do
      before { facts[:operatingsystemmajrelease] = '7' }

      it 'should fail' do
        expect { should contain_class('policykit::params') }.
          to raise_error(Puppet::Error, /not supported on operatingsystemmajrelease 7/)
      end
    end
  end

  describe 'for osfamily Debian' do
    let(:facts) {{ :osfamily => 'Debian' }}

    it { should contain_class('policykit::params') }
  end

  describe 'unsupported osfamily' do
    let :facts do 
      {
        :osfamily        => 'Solaris',
        :operatingsystem => 'Solaris',
      }
    end
  
    it 'should fail' do
      expect { should contain_class('policykit::params') }.
        to raise_error(Puppet::Error, /not supported on Solaris/)
    end
  end

end
