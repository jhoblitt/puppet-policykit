Puppet policykit Module
=========================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-policykit.png)](https://travis-ci.org/jhoblitt/puppet-policykit)


#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Usage](#usage)
4. [Limitations](#limitations)
    * [Tested Platforms](#tested-platforms)
5. [Support](#support)

Overview
--------

Manages the policykit package


Description
-----------

Ensures that the PolicyKit or
[`polkit`](http://www.freedesktop.org/wiki/Software/polkit/) is installed and
provides a mechanism for managing localauthority configuration files.


Usage
-----

To only ensure that the policykit software package is installed.  Note that
this isn't nessicary when used the `policykit::localauthority` defined type as
including the `policykit` class is implied.

    include policykit

Create a new authority file.

    policykit::localauthority { 'Disable suspend':
       identity        => 'unix-user:*',
       action          => 'org.freedesktop.upower.suspend',
       result_active   => 'no',
       result_any      => 'no',
       result_inactive => 'no',
    }

To remove an existing authority configuration. Note that all of the params are
still required.  This is arguably a bug.

    policykit::localauthority { 'Disable suspend':
       ensure          => absent,
       identity        => 'unix-user:*',
       action          => 'org.freedesktop.upower.suspend',
       result_active   => 'no',
       result_any      => 'no',
       result_inactive => 'no',
    }


Limitations
-----------

At present, only support for `$::osfamily == 'RedHat'` has been implimented.
Adding other Linux distrubtions should be trivial.  Policykit is not present in
releases prior to el6.x.

### Tested on

* el6.x


Support
-------

Please log tickets and issues at [github](https://github.com/jhoblitt/puppet-module_skel/issues)


