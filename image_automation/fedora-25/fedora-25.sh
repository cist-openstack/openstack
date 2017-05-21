#!/bin/bash
cd /tmp/

GUI="y"
VNC="y"

if [ "$VNC" == "y" ]; then
    echo "What user should we use for VNC? "
    read VNCUSER
fi

# Set up GUI
if [ $GUI == "y" ]; then
    systemctl set-default graphical.target    
    if [ "$VNC" == "y" ]; then
        dnf -y install tigervnc 
	dnf -y install tigervnc-server
        cp /usr/lib/systemd/system/vncserver\@.service /etc/systemd/system/vncserver@.service
        sed -ie "s/<USER>/$VNCUSER/g" /etc/systemd/system/vncserver\@.service
        useradd $VNCUSER
    fi
fi

# Get cool packages
dnf -y install mlocate 
dnf -y install bind-utils 
dnf -y install vim 
dnf -y install samba-client 
dnf -y install httpd 
dnf -y install nfs-utils 
dnf -y install net-tools
dnf -y install gdisk 
dnf -y install cifs-utils 
dnf -y install at 
dnf -y install wget 
dnf -y install lvm2 
dnf -y install star 
dnf -y install git 
dnf -y install acpid 
dnf -y install tmux 
dnf -y install chrony 
dnf -y install telnet 
dnf -y install ansible 
dnf -y install nrpe 
dnf -y install fping
dnf -y install firewalld 
dnf -y install fail2ban 
dnf -y install cloud-init 
dnf -y install java
   
# Download and install telegraf for Grafana metric collection
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.2.1.x86_64.rpm
sudo dnf -y telegraf-1.2.1.x86_64.rpm

# Upgrade system
dnf -y upgrade;

# Configure telegraf
git clone https://github.com/cist-openstack/openstack.git /tmp/openstack
unalias cp
cp /tmp/openstack/telegraf/hangar-snapstack-lab/telegraf.conf /etc/telegraf/telegraf.conf
cp /tmp/openstack/image_automation/centos7/sudoers /etc/sudoers
cp /tmp/openstack/image_automation/centos7/cloud.cfg /etc/cloud/cloud.cfg

# Start chrony, telegraf, firewall, cloud-init
systemctl start chronyd
systemctl enable chronyd
systemctl enable telegraf
systemctl enable cloud-init
systemctl enable vncserver@:1.service

# Allow SSH through firewalld
firewall-cmd --add-service=ssh --permanent
firewall-cmd --add-service=vnc-server --permanent
firewall-cmd --reload

# Disabling zeroconf
echo "NOZEROCONF=yes" >> /etc/sysconfig/network;

echo "###################################################################"
echo "################# SET THE VNCPASSWORD NOW #########################"
echo "############### SET THE USER'S PASSWORDS NOW ######################"
echo "######################### REBOOT ##################################"
echo "###################################################################"

echo "Setting the vncpasswd for $VNCUSER"
vncpasswd $VNCUSER
