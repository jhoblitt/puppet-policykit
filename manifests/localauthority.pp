# == Define: policykit::localauthority
#
# === Examples
#
# policykit::localauthority { 'Disable suspend':
#    identity        => 'unix-user:*',
#    action          => 'org.freedesktop.upower.suspend',
#    result_active   => 'no',
#    result_any      => 'no',
#    result_inactive => 'no',
# }
#
# === Copyright
#
# Copyright: Steven Armstrong, Nico Schottelius
# Copyright (C) 2013 Joshua Hoblitt
#
define policykit::localauthority(
  $identity,
  $action,
  $result_any,
  $result_inactive,
  $result_active,
  $ensure = present
) {
  validate_string($identity)
  validate_string($action)
  validate_string($result_any)
  validate_string($result_inactive)
  validate_string($result_active)
  validate_re($ensure, ['^present$', '^absent'])

  include policykit

  $safe_name = regsubst($name, '[^a-zA-Z-]', '_', 'G')
  $config_file = "${policykit::params::policykit_local_path}/${safe_name}.pkla"

  file { $config_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
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

