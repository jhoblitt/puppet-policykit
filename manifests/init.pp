# == Class: policykit
#
# === Examples
#
# include policykit
#
# === Copyright
#
# Copyright: Steven Armstrong, Nico Schottelius
# Copyright (C) 2013 Joshua Hoblitt
#
class policykit inherits policykit::params {

  package { $policykit::params::policykit_package:
    ensure => present,
    alias  => 'policykit',
  }

  file { $policykit::params::policykit_local_path:
    ensure  => directory,
    require => Package['policykit'],
  }

}

