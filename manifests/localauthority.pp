#
# D-INFK SANS
# ===========
#
# Copyright: Steven Armstrong, Nico Schottelius
#
# License: GPLv3
#

#
# policykit::localauthority { 'Disable suspend':
#    identity => 'unix-user:*',
#    action => 'org.freedesktop.upower.suspend',
#    result_active => 'no',
#    result_any => 'no',
# }
# 

define policykit::localauthority($identity, $action, $result_active, $result_any) {

   File { owner => 'root', group => 'root' }

   file { '/etc/polkit-1/localauthority/50-local.d':
      ensure => directory,
      require => Package['policykit'],
   }

   $safe_name = regsubst($name, '[^a-zA-Z-]', '_', 'G')
   $config_file = "/etc/polkit-1/localauthority/50-local.d/${safe_name}.pkla"

   file { $config_file:
      mode => 644,
      content => "[$name]
Identity=$identity
Action=$action
ResultActive=$result_active
ResultAny=$result_any
",
   }

}

