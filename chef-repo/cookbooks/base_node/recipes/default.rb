#
# Cookbook Name:: base_node
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Create repos
cookbook_file '/etc/yum.repos.d/all.repo' do
  source 'all.repo'
  action :create
end

cookbook_file '/etc/motd' do
  source 'motd'
  action :create
end

# Create directories
directory '/etc/telegraf' do
  owner 'telegraf'
  mode '0755'
  action :create
end

directory '/etc/telegraf/scripts' do
  owner 'telegraf'
  mode '0755'
  action :create
end

# Make a cron to run chef-client every 60 mins
cron 'chef-client' do
  minute '0'
  hour '*'
  command '/usr/bin/chef-client'
end

# Install packages
package 'base_packages' do
  package_name ['wget',
                'mlocate',
                'vim',
                'chrony',
                'git',
		'telegraf',
                'tigervnc',
                'tigervnc-server']
  action :upgrade
end

# Change permissions on /var/log/messages
file '/var/log/messages' do
  mode '0666'
end

# Copy configuration files
# sudoers
cookbook_file '/etc/sudoers' do
  source 'sudoers'
  action :create
end

# host file
cookbook_file '/etc/hosts' do
  source 'hosts'
  action :create
end

# repos file
cookbook_file '/etc/yum.repos.d/all.repo' do
  source 'all.repo'
  action :create
end

# cloud config
if File.exist?('/etc/cloud/cloud.cfg')
  cookbook_file '/etc/cloud/cloud.cfg' do
    source 'cloud.cfg'
    action :create
  end
end

# telegraf configs and scripts
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

cookbook_file '/etc/chrony.conf' do
  source 'chrony.conf'
  action :create
end

# Restart services
service 'telegraf' do
  action [:enable, :start, :restart]
end

service 'chronyd' do
  action [:enable, :start]
end
