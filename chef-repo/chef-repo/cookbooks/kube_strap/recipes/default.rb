#
# Cookbook Name:: kube_strap
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_repository 'virt7-docker-common-release' do
  description 'virt7-docker-common-release'
  baseurl 'http://cbs.centos.org/repos/virt7-docker-common-release/x86_64/os/'
  gpgcheck = 0
  action :create
end

package 'base_packages' do
  package_name ['epel-release',
                'wget',
                'mlocate',
                'vim',
                'chrony',
                'git',
                'erlang',
                'tigervnc',
                'tigervnc-server',
                'kubernetes',
                'docker',
                'etcd']
  action :upgrade
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
