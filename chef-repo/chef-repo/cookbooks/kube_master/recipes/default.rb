#
# Cookbook Name:: kube_master
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

cookbook_file '/etc/etcd/etcd.conf' do
  source 'etcd'
  action :create
end

cookbook_file '/etc/kubernetes/apiserver' do
  source 'apiserver'
  action :create
end

service 'etcd' do
  action [:enable, :start]
end

service 'kube-apiserver' do
  action [:enable, :start]
end

service 'kube-controller-manager' do
  action [:enable, :start]
end

service 'kube-scheduler' do
  action [:enable, :start]
end
