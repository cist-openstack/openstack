#/bin/bash

# Get a bunch of sweet packages
apt-get install -y mlocate vim samba-common-bin smbclient apache2 \
net-tools gdisk lvm2 at fping git acpid tmux chrony \
ansible nagios-nrpe-plugin fping firewalld cloud-init ssh x11vnc selinux-utils;

# Get telegraf for Grafana monitoring
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.2.1_amd64.deb
sudo dpkg -i telegraf_1.2.1_amd64.deb

# dpkg cloud-init
dpkg-reconfigure cloud-init

# Clone the cist-openstack repo
git clone https://github.com/cist-openstack/openstack.git

# overwrite the telegraf configuration
mv openstack/telegraf/telegraf.conf /etc/telegraf/telegraf.conf

# Tweak the ssh settings
sed -ie 's/.*PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config;
sed -ie 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# Create the x11vnc service
echo "[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
 
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/USERNAME/.vnc/passwd -rfbport 5900 -shared
 
[Install]
WantedBy=multi-user.target" > /lib/systemd/system/x11vnc.service

# Start services
systemctl daemon-reload
systemctl enable x11vnc.service
systemctl start ssh;
systemctl enable ssh;
systemctl start chronyd;
systemctl enable chronyd;

# Open firewall ports for ssh, http, and vnc
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=443/tcp --permanent
firewall-cmd --add-port=5901/tcp --permanent
firewall-cmd --add-port=5902/tcp --permanent
firewall-cmd --add-port=5903/tcp --permanent
firewall-cmd --add-port=5904/tcp --permanent
firewall-cmd --add-port=5905/tcp --permanent
firewall-cmd --reload


echo "############################################################################"
echo "############################################################################"
echo "############################################################################"
echo "############################################################################"
echo "############       CONFIGURE /ETC/CLOUD/CLOUD.CFG       ####################"
echo "############    CONFIGURE VNC PASSWD (VNCSTOREPASSWD    ####################"
echo "############       CONFIGURE DEFAULT USER PASSWORD      ####################"
echo "############       CONFIGURE SUDO ACCESS FOR USERS      ####################"
echo "############################################################################"
echo "############################################################################"
echo "############################################################################"
echo "############################################################################"

