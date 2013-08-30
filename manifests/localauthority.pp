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

define policykit::localauthority(
  $identity,
  $action,
  $result_any,
  $result_inactive,
  $result_active,
  $ensure = present
) {

  File { owner => 'root', group => 'root' }

  $safe_name = regsubst($name, '[^a-zA-Z-]', '_', 'G')
  $config_file = "/etc/polkit-1/localauthority/50-local.d/${safe_name}.pkla"

  file { $config_file:
    ensure  => $ensure,
    mode    => '0644',
    content => "[${name}]
Identity=${identity}
Action=${action}
ResultAny=${result_any}
ResultInactive=${result_inactive}
ResultActive=${result_active}
",
  }

}

