#
# Cookbook Name:: base_node
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Create directories
directory '/etc/telegraf/scripts' do
  action :create
  owner 'telegraf'
  mode '0755'
end

directory '/var/log/telegraf' do
  action :create
  owner 'telegraf'
  group 'telegraf'
  mode '666'
  recursive true
end

# Install packages
package 'base_packages' do
  package_name ['epel-release',
                'wget',
                'mlocate',
                'vim',
                'chrony',
                'git',
                'erlang',
                'telegraf',
                'tigervnc',
                'tigervnc-server']
  action :upgrade
end

# Copy configuration files
cookbook_file '/etc/sudoers' do
  source 'sudoers'
  action :create
end

cookbook_file '/etc/hosts' do
  source 'hosts'
  action :create
end

cookbook_file '/etc/cloud/cloud.cfg' do
  source 'cloud.cfg'
  action :create
end

cookbook_file '/etc/telegraf/telegraf.conf' do
  source 'telegraf.conf'
  action :create
end

cookbook_file '/etc/telegraf/scripts/check_syslog_errors.sh' do
  source 'check_syslog_errors.sh'
  owner 'telegraf'
  group 'telegraf'
  mode '755'
  action :create
end

cookbook_file '/etc/telegraf/scripts/instance_count.sh' do
  source 'instance_count.sh'
  owner 'telegraf'
  group 'telegraf'
  mode '755'
  action :create
end

cookbook_file '/etc/telegraf/scripts/physical_host_count_total.sh' do
  source 'physical_host_count_total.sh'
  owner 'telegraf'
  group 'telegraf'
  mode '755'
  action :create
end

cookbook_file '/etc/telegraf/scripts/physical_host_count_up.sh' do
  source 'physical_host_count_up.sh'
  owner 'telegraf'
  group 'telegraf'
  mode '755'
  action :create
end

# Restart services
service 'telegraf' do
  action [:enable, :start]
end

service 'chronyd' do
  action [:enable, :start]
end
