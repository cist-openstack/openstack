#
# Cookbook Name:: kube_minion
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#cookbook_file '/etc/kubernetes/kubelet' do
#  source 'kubelet'
#  action :create
#end

template '/etc/kubernetes/kubelet' do
  source 'kubelet.erb'
  variables(
        :hostname => node['machinename']
)
end

service 'kube-proxy' do
  action [:enable, :start]
end

service 'kubelet' do
  action [:enable, :start]
end

service 'docker' do
  action [:enable, :start]
end
