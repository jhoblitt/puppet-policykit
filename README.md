Puppet policykit Module
=========================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-policykit.png)](https://travis-ci.org/jhoblitt/puppet-policykit)


#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Usage](#usage)
4. [Limitations](#limitations)
    * [Tested Platforms](#tested-platforms)
5. [Versioning](#versioning)
6. [Support](#support)
7. [See Also](#see-also)


Overview
--------

Manages the policykit package


Description
-----------

Ensures that the PolicyKit or
[`polkit`](http://www.freedesktop.org/wiki/Software/polkit/) package is
installed and provides a mechanism for managing localauthority configuration
files.

### Forked

This module was forked from [git://git.sans.ethz.ch/puppet-modules/policykit]
in order to update it's functionality and add basic tests.


Usage
-----

To only ensure that the policykit software package is installed.  Note that
this isn't nessicary when using the `policykit::localauthority` defined type as
including the `policykit` class is implied.

```puppet
include policykit
```

Create a new authority file.

```puppet
policykit::localauthority { 'Disable suspend':
   identity        => 'unix-user:*',
   action          => 'org.freedesktop.upower.suspend',
   result_active   => 'no',
   result_any      => 'no',
   result_inactive => 'no',
}
```

To remove an existing authority configuration. Note that all of the params are
still required.  This is arguably a bug.

```puppet
policykit::localauthority { 'Disable suspend':
   ensure          => absent,
   identity        => 'unix-user:*',
   action          => 'org.freedesktop.upower.suspend',
   result_active   => 'no',
   result_any      => 'no',
   result_inactive => 'no',
}
```


Limitations
-----------

At present, only support for `$::osfamily == 'RedHat'` has been implimented.
Adding other Linux distrubtions should be trivial.  Policykit is not present in
releases prior to el6.x.

### Tested on

 * el6.x


Versioning
----------

This module is versioned according to the [Semantic Versioning
2.0.0](http://semver.org/spec/v2.0.0.html) specification.


Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-policykit/issues)


See Also
--------

 * [`polkit`](http://www.freedesktop.org/wiki/Software/polkit/)

