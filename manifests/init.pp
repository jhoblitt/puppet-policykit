#
# D-INFK SANS
# ===========
#
# Copyright: Steven Armstrong, Nico Schottelius
#
# License: GPLv3
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

