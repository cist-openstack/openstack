#
# Cookbook Name:: kube_strap
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'base_packages' do
  package_name ['docker',
                'kubernetes',
                'etcd']
  action :upgrade
end

execute 'daemon-reload' do
  command 'systemctl daemon-reload'
  action :nothing
  user 'root'
end

execute 'restart-docker' do
  command 'systemctl restart docker'
  action :nothing
  user 'root'
end

cookbook_file '/usr/lib/systemd/system/docker.service' do
  source 'docker'
  action :create
  notifies :action, 'execute[daemon-reload]', :immediately
  notifies :action, 'execute[restart-docker]', :immediately
end

service 'chronyd' do
  action [:enable, :start]
end

service 'firewalld' do
  action [:disable, :stop]
end

cookbook_file '/etc/kubernetes/config' do
  source 'kubeconfig'
  action :create
end
