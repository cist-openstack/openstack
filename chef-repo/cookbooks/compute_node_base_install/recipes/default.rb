#
# Cookbook Name:: compute_node_base_install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_package 'base_packages' do
  package_name ['wget',
                'mlocate',
                'vim',
                'chrony',
                'git',
                'python-openstackclient',
                'openstack-packstack',
                'erlang',
                'gnome-boxes',
                'virt-install',
                'virt-manager',
                'virt-viewer',
                'virt-top',
                'libguestfs-inspect-icons',
                'libguestfs-tools',
                'libguestfs-tools-c',
                'libvirt',
                'qemu-kvm',
                'qemu-kvm-tools',
                'libvirt',
                'libvirt-client',
                'virt-who',
                'fence-virtd-libvirt',
                'fence-virtd-multicast',
                'fence-virtd-serial',
                'libvirt-cim',
                'libvirt-java',
                'libvirt-snmp',
                'perl-Sys-Virt',
                'tigervnc',
                'tigervnc-server']
  action :upgrade
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
