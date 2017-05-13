#
# Cookbook Name:: compute_node_base_install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_package 'base_packages' do
  package_name ['epel-release',
                'wget',
                'mlocate',
                'vim',
                'chrony',
                'centos-release-openstack-liberty',
                'git',
                'python-openstackclient',
                'openstack-packstack',
                'erlang',
                'tigervnc',
                'tigervnc-server']
  action :upgrade
end

execute 'yum groupinstall -y "Virtualization" "Virtualization Client" "Virtualization Hypervisor" "Virtualization Platform" "Virtualization Tools"' do
  user 'root'
end

execute 'yum -y upgrade' do
  user 'root'
end

service 'chronyd' do
  action [:enable, :start]
end

service 'NetworkManager' do
  action [:disable, :stop]
end

service 'firewalld' do
  action [:disable, :stop]
end

service execute 'sudo sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config' do
  user 'root'
end
