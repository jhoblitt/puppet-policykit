#
# D-INFK SANS
# ===========
#
# Copyright: Steven Armstrong, Nico Schottelius
#
# License: GPLv3
#

class policykit {

   package { 'policykit-1': alias => 'policykit', ensure => latest }

   file { '/etc/polkit-1/localauthority/50-local.d':
      ensure => directory,
      require => Package['policykit'],
   }

}

