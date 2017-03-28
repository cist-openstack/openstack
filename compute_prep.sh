#!/bin/bash

IP=`ip ad | grep 'inet ' | grep -v 127.0.0.1 | grep 136 | awk '{print $2}' | cut -c -15`

if [ "$IP" == "136.142.139.131" ]; then
 hostnamectl set-hostname compute1.cist.pitt.edu
elif [ "$IP" == "136.142.139.132" ]
 hostnamectl set-hostname compute5.cist.pitt.edu
elif [ "$IP" == "136.142.139.136" ]
 hostnamectl set-hostname compute2.cist.pitt.edu
elif [ "$IP" == "136.142.139.138" ]
 hostnamectl set-hostname compute3.cist.pitt.edu
elif [ "$IP" == "136.142.139.139" ]
 hostnamectl set-hostname compute4.cist.pitt.edu
elif [ "$IP" == "136.142.139.140" ]
 hostnamectl set-hostname compute6.cist.pitt.edu
elif [ "$IP" == "136.142.139.141" ]
 hostnamectl set-hostname compute7.cist.pitt.edu
elif [ "$IP" == "136.142.139.142" ]
 hostnamectl set-hostname compute8.cist.pitt.edu
elif [ "$IP" == "136.142.139.143" ]
 hostnamectl set-hostname compute9.cist.pitt.edu
elif [ "$IP" == "136.142.139.144" ]
 hostnamectl set-hostname compute10.cist.pitt.edu
elif [ "$IP" == "136.142.139.146" ]
 hostnamectl set-hostname compute11.cist.pitt.edu
elif [ "$IP" == "136.142.139.147" ]
 hostnamectl set-hostname compute12.cist.pitt.edu
elif [ "$IP" == "136.142.139.148" ]
 hostnamectl set-hostname compute13.cist.pitt.edu
elif [ "$IP" == "136.142.139.149" ]
 hostnamectl set-hostname compute14.cist.pitt.edu
elif [ "$IP" == "136.142.139.150" ]
 hostnamectl set-hostname compute15.cist.pitt.edu
elif [ "$IP" == "136.142.139.151" ]
 hostnamectl set-hostname compute16.cist.pitt.edu
elif [ "$IP" == "192.168.100.218" ]
 hostnamectl set-hostname derp.cist.pitt.edu
else
 hostnamectl set-hostname isuckatipaddresses.cist.pitt.edu
fi

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
