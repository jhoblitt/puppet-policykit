# == Class: policykit
#
# === Examples
#
# include policykit
#
# ---
# policykit::policies :
#   'Disable suspend' :
#     identity        : 'unix-user:*'
#     action          : 'org.freedesktop.upower.suspend'
#     result_active   : 'no'
#     result_any      : 'no'
#     result_inactive : 'no'
#
# === Copyright
#
# Copyright: Steven Armstrong, Nico Schottelius
# Copyright (C) 2013 Joshua Hoblitt
#
class policykit (
  $policies = {}
) inherits policykit::params {

  package { $policykit::params::policykit_package:
    ensure => present,
    alias  => 'policykit',
  }

  file { $policykit::params::policykit_local_path:
    ensure  => directory,
    require => Package['policykit'],
  }

  create_resources('policykit::localauthority', $policies)

}

