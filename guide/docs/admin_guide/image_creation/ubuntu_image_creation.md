### Ubuntu 16.04 Image Creation

My experience creating an Ubuntu 16.04 cloud image. A checklist of sorts. Most credit goes to the [OpenStack documentation](http://docs.openstack.org/image-guide/ubuntu-image.html) and [VNC documentation](https://help.ubuntu.com/community/VNC/Servers)

> Before sysprepping and deploying the image, it's critical to make sure that you can access everything you need to access. This means testing SSH and VNC, firewall, SELinux, etc. It is also important to understand how large the image must be. If you create a 7GB image with 20GB of disk space, all of that space gets written to the image file which can cause some very long launch times and can be a real nightmare to upload to the OpenStack Controller node. Because we have the ability to add volumes at will through OpenStack, I think the base image +2GB is a perfectly reasonable size as this should be enough to cover any packages and updates installed over the course of the distro's version.

## Checklist:
### Determine Disk Size
It's very important to understand that when you initially create a Virtual Machine you are specifying the disk size. When you sysprep and copy this image, it's going to include all pre-determined disk space - whether it is used or not. Due to high launch times and the struggle to get such large files uploaded to the OpenStack Controller node, our goal is to keep these images as small as possible. A good rule of thumb moving forward is to look at the size of the original installation media and add 2-3GB for additional packages/programs and future updates.

### Connect to the Network
Upon initialization of your new Ubuntu virtual machine, we need to keep the network settings at their defaults and connect to the network. We can do this by running the 'dhclient' command. Ping out to test connectivity.  
`$ dhclient`

### Install Packages
This is the time to download all of the packages you want. Here's a pretty good list:
- mlocate  
- vim  
- samba-common-bin  
- smbclient  
- apache2  
- net-tools  
- gdisk  
- lvm2  
- at  
- fping  
- git  
- acpid  
- tmux  
- chrony  
- ansible  
- nagios-nrpe-plugin  
- fping  
- firewalld  
- cloud-init  

```
$ apt-get install -y mlocate vim samba-common-bin smbclient apache2 \  
net-tools gdisk lvm2 at fping git acpid tmux chrony \  
ansible nagios-nrpe-plugin fping firewalld cloud-init ssh x11vnc selinux-utils
```

### Create the Default User
Every image should have a default user of cist and a default password of **Panther$**. This can be done pre-installation or post-installation. If post-installation, open a terminal and follow these steps:  
`$ useradd panther`  
`$ passwd panther`  

### Make the default user an administrator - edit the /etc/sudoers file.
`$ visudo`  

```
# User privilege specification
root    ALL=(ALL:ALL) ALL
panther ALL=(ALL:ALL) ALL
```

### Install SSH
Install the ssh daemon:  
`$ sudo apt-get -y install ssh`

Configure the ssh daemon to start automatically:  
`$ systemctl start ssh`
`$ systemctl enable ssh`

Edit the /etc/ssh/sshd_config file and allow root login (NOT recommended for production servers! This is good for test environment only.)  
`$ vim /etc/ssh/sshd_config`

Find and edit the following two lines:  
```
PermitRootLogin yes
PasswordAuthentication yes
```

### Install VNC
Install the x11vnc service. The following instructions are for a systemd environment. See this site to install x11vnc on other systems. https://help.ubuntu.com/community/VNC/Servers  
`$ sudo apt-get install x11vnc`  

Set the VNC password:  
`$ x11vnc -storepasswd`

Create the VNC service. Because we want VNC to run as a service in the background (using systemctl), we will configure the service accordingly. Change the USERNAME and port accordingly. DO NOT USE THE ROOT ACCOUNT FOR THIS! Use the default user account.  
`$ sudo nano /lib/systemd/system/x11vnc.service`
```
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/USERNAME/.vnc/passwd -rfbport 5900 -shared

[Install]
WantedBy=multi-user.target
```

Start and enable the service:  
`$ sudo systemctl daemon-reload`  
`$ sudo systemctl start x11vnc.service`  
`$ sudo systemctl enable x11vnc.service`

### Open the Firewall
If firewalld is running, open port 22 for SSH and the port you specified in the VNC service file for VNC:  
`$ firewall-cmd --add-port=5900/tcp --permanent`  
`$ firewall-cmd --add-port=22/tcp --permanent`  
`$ firewall-cmd --reload`

### Set the Message of the Day
If you'd like to configure a special message, do it now:  
`$ vim /etc/motd`

Now is the time to test VNC / SSH capabilities. Ensure that the virtual machine is accessible.  

### Configure cloud-init
The cloud-init file is where the OpenStack metadata server gets image-specific data. This data tells OpenStack which rules and changes to apply to the image as it launches. When running dpkg-reconfigure, keep all of the defaults.  
`$ sudo apt-get install cloud-init`  
`$ dpkg-reconfigure cloud-init`  

Edit the cloud configuration file. Find and change to the following:  
`$ vim /etc/cloud/cloud.cfg`
```
users:
   - default
   - cist
disable_root: false
```

### Shutdown the Virtual Machine
`$ sudo shutdown now`

### Take a snapshot!
Okay, that was a lot of hard work. We have the image almost ready. Take a snapshot of it! In order to sysprep the image we need to undefine it from libvirt. If we want to make tweaks we can always come back to our snapshot. This is very important to not have to start over and for maintaining updates.  
- Shut down the VM.  
- In Virtual machine manager, click Virtual Machine > Clone.  

### Sysprep the Image
On the hypervisor, log into the terminal. We must use the virt-sysprep tool to wipe out the specific configs of the image.  

List all of the images and locate the image you just built.
```
$ virsh list --all
 Id    Name                           State
----------------------------------------------------
 14    centos7.0-minimal              running
 16    centos7.0-everything           running
 -     ubuntu16.04-desktop            shut off
 -     ubuntu16.04-desktop-clone      shut off
 -     ubuntu16.04-server             shut off
```

Sysprep the image you'd like to deploy:  
`$ virt-sysprep -d ubuntu16.04-desktop-clone`   

Green is good. If sysprep passes then the image is now ready to transfer to OpenStack! You're now ready to upload your image to OpenStack. Locate your image's disk file and copy it to your OpenStack instance via your favorite method or even using the OpenStack dashboard. If you used KVM, your disk image file will be located in /var/lib/libvirt/images.
