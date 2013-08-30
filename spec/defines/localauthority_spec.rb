require 'spec_helper'

describe 'policykit::localauthority', :type => :define do
  let :facts do
    {
      :osfamily          => 'RedHat',
      :lsbmajdistrelease => '6',
    }
  end

  describe 'simple case' do
    let(:title) { 'foo' }
    let :params do
      { 
        :identity        => 'bar',
        :action          => 'baz',
        :result_any      => 'no',
        :result_inactive => 'no',
        :result_active   => 'no',
      }
    end
    
    it do
      should contain_file('/etc/polkit-1/localauthority/50-local.d/foo.pkla').
        with({
        :ensure => 'present',
        :mode   => '0644',
      })
    end
  end

  describe 'title space to underscore conversion in file path' do
    # example from https://wiki.archlinux.org/index.php/PolicyKit
    let(:title) { 'Ban users jack and jill from using gparted' }
    let :params do
      { 
        :identity        => 'unix-user:jack;unix-user:jill',
        :action          => 'org.archlinux.pkexec.gparted',
        :result_any      => 'no',
        :result_inactive => 'no',
        :result_active   => 'no',
      }
    end
    
    it do
      should contain_file('/etc/polkit-1/localauthority/50-local.d/Ban_users_jack_and_jill_from_using_gparted.pkla').
        with({
        :ensure => 'present',
        :mode   => '0644',
      })
    end
  end

  describe 'example from docs' do
    # example from https://wiki.archlinux.org/index.php/PolicyKit
    let(:title) { 'Disable suspend' }
    let :params do
      { 
        :identity        => 'unix-user:*',
        :action          => 'org.freedesktop.upower.suspend',
        :result_active   => 'no',
        :result_any      => 'no',
        :result_inactive => 'no',
      }
    end
    
    it do
      should contain_file('/etc/polkit-1/localauthority/50-local.d/Disable_suspend.pkla').
        with({
        :ensure => 'present',
        :mode   => '0644',
      })
    end
  end

  describe 'ensure => absent' do
    let(:title) { 'foo' }
    let :params do
      { 
        :identity        => 'bar',
        :action          => 'baz',
        :result_any      => 'no',
        :result_inactive => 'no',
        :result_active   => 'no',
        :ensure          => 'absent',
      }
    end
    
    it do
      should contain_file('/etc/polkit-1/localauthority/50-local.d/foo.pkla').
        with({
        :ensure => 'absent',
      })
    end
  end

end
