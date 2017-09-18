#!/bin/bash
yum -y install epel-release;
yum -y install https://rdoproject.org/repos/rda-release.rpm
yum -y install wget mlocate vim chrony centos-release-openstack-ocata git;
yum -y install python-openstackclient openstack-packstack;
yum -y install erlang
yum -y upgrade;

systemctl start chronyd;
systemctl enable chronyd;
systemctl stop NetworkManager;
systemctl disable NetworkManager;
systemctl stop firewalld;
systemctl disable firewalld;

sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config ;
