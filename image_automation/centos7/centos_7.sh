#!/bin/bash
cd /tmp/

echo "Hi! Let's make a CentOS 7 image."
echo -e
echo "Do you want a GUI for this server? (y)es or (n)o. Please select y or n: "
read GUI
echo "Okay, you said $GUI to a GUI. Cool."
echo -e
echo "Do you want to set up VNC access to this server? (y)es or (n)o? Please select y or n: "
read VNC

if [ "$VNC" == "y" ]; then
    echo "What user should we use for VNC? "
    read VNCUSER
fi

# Set up GUI
if [ $GUI == "y" ]; then
    /usr/bin/yum -y group install "X Window System" "GNOME"
    systemctl set-default graphical.target    
    if [ "$VNC" == "y" ]; then
        /usr/bin/yum -y install tiger-vnc tigervnc tigervnc-server
        /usr/bin/cp /usr/lib/systemd/system/vncserver\@.service /etc/systemd/system/vncserver@.service
        sed -ie "s/<USER>/$VNCUSER/g" /etc/systemd/system/vncserver\@.service
        useradd $VNCUSER
    fi
fi

# Install epel repository
/usr/bin/yum -y install epel-release.noarch

# Get cool packages
/usr/bin/yum -y install mlocate bind-utils vim samba-client httpd nfs-utils net-tools
/usr/bin/yum -y install gdisk cifs-utils at /usr/bin/wget lvm2 star git acpid  tmux chrony telnet ansible nrpe fping
/usr/bin/yum -y install firewalld fail2ban python2-pip.noarch cloud-init java
   
# Download and install telegraf for Grafana metric collection
/usr/bin/wget https://dl.influxdata.com/telegraf/releases/telegraf-1.2.1.x86_64.rpm
sudo /usr/bin/yum -y localinstall telegraf-1.2.1.x86_64.rpm

# Upgrade system
/usr/bin/yum -y upgrade;

# Configure telegraf
/usr/bin/git clone https://github.com/cist-openstack/openstack.git
unalias cp
/usr/bin/cp openstack/telegraf/hangar-snapstack-lab/telegraf.conf /etc/telegraf/telegraf.conf
/usr/bin/cp openstack/image_automation/centos7/sudoers /etc/sudoers
/usr/bin/cp openstack/image_automation/centos7/cloud.cfg /etc/cloud/cloud.cfg
/usr/bin/cp openstack/image_automation/centos7/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0
/usr/bin/cp openstack/image_automation/centos7/grub /etc/default/grub
/usr/sbin/grub2-mkconfig -o /boot/grub2/grub.cfg
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
