Centos_base Cookbook
====================

Installs/Configures CentOS 7.x base image

Requirements
------------

### Platform:

* Centos (>= 7.3)

### Cookbooks:

*No dependencies defined*

Attributes
----------

*No attributes defined*

Recipes
-------

### centos_base::default

Entrypoint for configuring OS according to defaults

### centos_base::logging

Configures journald/journalctl for persistent logging

### centos_base::administration

Creates local user accounts with sudo access for each data bag entry in `sysadmins` collection


License and Author
------------------

Author:: David Alexander (<opensource@thelonelyghost.com>)

Copyright:: 2018, Grafeas Group, Ltd.

License:: MIT

