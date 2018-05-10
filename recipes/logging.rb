#
# Cookbook:: centos_base
# Recipe:: logging
#
# Copyright:: 2018, Grafeas Group, Ltd.

service 'systemd-journald' do
  # Purely exists so we can restart it
  action :nothing
end

directory '/var/log/journal' do
  # === Persist Journald log entries ===
  # By default, journald uses the `Storage=auto` option, which tries to persist logs to
  # /var/log/journal if it exists. Also by default in CentOS 7.x, it does not exist. This
  # makes it so journald will actually write logs to the filesystem and persist on reboot.
  action :create

  notifies :restart, 'service[systemd-journald]', :immediately
end

template '/etc/systemd/journald.conf' do
  source 'journald.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'

  notifies :restart, 'service[systemd-journald]', :immediately
end
