# == Class: policykit::params
#
# This class should be considered private.
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2013 Joshua Hoblitt
#
class policykit::params {

  case $::osfamily {
    'redhat': {
      case $::operatingsystemmajrelease {
        6: {
          $policykit_package    = 'polkit'
          $policykit_local_path = '/etc/polkit-1/localauthority/50-local.d'
        }
        default: {
          fail("Module ${module_name} is not supported on operatingsystemmajrelease ${::operatingsystemmajrelease}")
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

}
