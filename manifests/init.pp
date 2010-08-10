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

}

