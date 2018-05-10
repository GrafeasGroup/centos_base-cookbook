#
# Cookbook:: centos_base
# Recipe:: default
#
# Copyright:: 2018, Grafeas Group, Ltd.

include_recipe '::logging'
include_recipe '::administration'

# TODO: Set ssh to non-default port
