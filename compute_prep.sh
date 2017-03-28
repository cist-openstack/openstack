#!/bin/bash

yum -y install epel-release;
yum -y install wget mlocate vim chrony centos-release-openstack-liberty git;
yum -y install python-openstackclient openstack-packstack;
yum -y install erlang tigervnc tigervnc-server;
yum -y group install "Virtualization" "Virtualization Client" "Virtualization Hypervisor" "Virtualization Platform" "Virtualization Tools"
yum -y upgrade;

systemctl start chronyd;
systemctl enable chronyd;
systemctl stop NetworkManager;
systemctl disable NetworkManager;
systemctl stop firewalld;
systemctl disable firewalld;

sudo sed -i '/PermitRootLogin/a PermitRootLogin yes' /etc/ssh/sshd_config ;
sudo sed -i '/PasswordAuthentication/a PasswordAuthentication yes' /etc/ssh/sshd_config ;
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config ;


echo "***************************************************************************************";
echo "***************************************************************************************";
echo "***************************************************************************************";
echo "***************************************************************************************";
echo "                  REBOOTING IN 10 SECONDS!!!!!!!!!!!!!!!!!!!!!!!                       ";
echo "***************************************************************************************";
echo "***************************************************************************************";
echo "***************************************************************************************";
echo "***************************************************************************************";

sleep 10;
sudo reboot now;
