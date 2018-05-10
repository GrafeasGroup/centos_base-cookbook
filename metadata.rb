name 'centos_base'
maintainer 'David Alexander'
maintainer_email 'opensource@thelonelyghost.com'
license 'MIT'
description 'Installs/Configures CentOS 7.x base image'
long_description 'Installs/Configures centos_base'
version '0.1.1'
chef_version '>= 12.14' if respond_to?(:chef_version)
source_url 'https://github.com/GrafeasGroup/centos_base-cookbook'
issues_url 'https://github.com/GrafeasGroup/centos_base-cookbook/issues'

supports 'centos', '>= 7.3'

recipe 'centos_base::default', 'Entrypoint for configuring OS according to defaults'
recipe 'centos_base::logging', 'Configures journald/journalctl for persistent logging'
recipe 'centos_base::administration', 'Creates local user accounts with sudo access for each data bag entry in `sysadmins` collection'
