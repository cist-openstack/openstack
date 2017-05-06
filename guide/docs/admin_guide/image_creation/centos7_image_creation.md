### CentOS 7 Image Creation.
[OpenStack's Image Guide](http://docs.openstack.org/image-guide/centos-image.html)

### Determine Disk Size
It's very important to understand that when you initially create a Virtual Machine you are specifying the disk size. When you sysprep and copy this image, it's going to include all pre-determined disk space - whether it is used or not. Due to high launch times and the struggle to get such large files uploaded to the OpenStack Controller node, our goal is to keep these images as small as possible. A good rule of thumb moving forward is to look at the size of the original installation media and add 2-3GB for additional packages/programs and future updates.

I found a workaround to the pre-determined disk issue. Once you finish your image, shut the VM down and clone it. The size of the clone will be reduced to what the actual disk is consuming. Sysprep the clone image and upload it rather than the original.

### Connect to the Network
Upon initialization of your new CentOS 7 virtual machine, we need to keep the network settings at their defaults and connect to the network. We can do this by running the 'dhclient' command. Ping out to test connectivity.  
`$ dhclient`

### Install Packages
This is the time to download all of the packages you want. Here's a pretty good list:  
- vim - The best text editor ever.
- lvm2 - Logical volume management tools.
- mlocate - Quickly find files on your system.
- star - An enhanced zip tool.
- samba-client - For working with LDAP.
- cifs-utils - For using CIFS file shares.
- nfs-utils - For using NFS file shares.
- at - A job scheduling program.
- wget - A command-line tool for downloading files.
- net-tools - Lots of network diagnostic tools.
- git - A code collaboration and versioning tool.
- tmux - A highly customizatable terminal emulator.
- chrony - A newer network time protocol.
- epel-release (this is the EPEL repository) - The Fedora repository for additional packages.
- nrpe (For Nagios configs) - A plugin for Nagios monitoring.
- telnet - A tool for connecting to specific ports.
- ansible - A devops tools for mass deployment of configurations to other hosts.
- fping - A tool to mass ping a list of hosts.
- firewalld - The new firewall.
- tigervnc - A remote desktop service.
- tigervnc-server  - A remote desktop service.
- java - Necessary to run several other program such as Splunk, Hbase, Confluence, etc.
- collectd - A metric collector to be used with InfluxDB/Grafana.
- telegraf - A metric collector to be used with InfluxDB/Grafana.

`$ yum -y install epel-release.noarch`  
`$ yum -y install mlocate bind-utils vim samba-client httpd nfs-utils net-tools \
gdisk cifs-utils at wget lvm2 star git acpid  tmux chrony telnet ansible nrpe fping \
firewalld fail2ban python2-pip.noarch cloud-init java tigervnc tigervnc-server collectd`  
`$ yum -y upgrade`  

### Start and enable chronyd (this is a network time protocol service.)
`$ systemctl start chronyd`  
`$ systemctl enable chronyd`

### Configure /etc/sysconfig/network
NOZEROCONF=<value>, where setting <value> to yes disables the zeroconf route. By default, the zeroconf route (169.254.0.0) is enabled when the system boots. For more information about zeroconf, refer to http://www.zeroconf.org/.  
`$ echo "NOZEROCONF=yes" >> /etc/sysconfig/network`

### Create the Default User
Every image should have a default user of cist and a default password of Panther$. This can be done pre-installation or post-installation. If post-installation, open a terminal and follow these steps:  
`$ useradd panther`  
`$ passwd panther`

### Make the default user as administrator
Edit the /etc/sudoers file using visudo.  

```
## Allow root to run any commands anywhere
root    ALL=(ALL)       NOPASSWD: ALL
panther ALL=(ALL)       NOPASSWD: ALL
```

### Set the Message of the Day
If you'd like to configure a special message, do it now. [www.chris.com](http://www.chris.com) has some excellent ASCII art!    
`$ vim /etc/motd`

### Set the GRUB2 Boot Parameters
Replace the default grub bootline parameters (/etc/default/grub) then save the changes.  
`$ vim /etc/default/grub`
```
GRUB_CMDLINE_LINUX="crashkernel=auto console=tty0 console=ttyS0,115200n8"
```
`$ grub2-mkconfig -o /boot/grub2/grub.cfg`  
```
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-3.10.0-229.14.1.el7.x86_64
Found initrd image: /boot/initramfs-3.10.0-229.14.1.el7.x86_64.img
Found linux image: /boot/vmlinuz-3.10.0-229.4.2.el7.x86_64
Found initrd image: /boot/initramfs-3.10.0-229.4.2.el7.x86_64.img
Found linux image: /boot/vmlinuz-3.10.0-229.el7.x86_64
Found initrd image: /boot/initramfs-3.10.0-229.el7.x86_64.img
Found linux image: /boot/vmlinuz-0-rescue-605f01abef434fb98dd1309e774b72ba
Found initrd image: /boot/initramfs-0-rescue-605f01abef434fb98dd1309e774b72ba.img
done
```

### Configure the cloud-init file
We are leaving security loose on this image as this is for testing and is behind a VPN. Create a 'cloud' user (panther), and use the /etc/cloud/cloud.cfg file to set that user's environment, shell, keys, groups, permissions, etc.  
`$ vim /etc/cloud/cloud.cfg`  

```
users:
 - default
 - name: cist
   gecos: Computer Information Systems & Technology
   primary-group: cist
   groups: root
   ssh-import-id: none
   lock_passwd: false
   sudo: ALL=(ALL) NOPASSWD:ALL
   shell: /bin/bash
```

### If this has a GUI, Configure VNC
Install the "GNOME" and "X Windows System" group packages.  
`$ yum -y group install "GNOME" "X Windows System"`  

### Take a snapshot!  
Okay, that was a lot of hard work. We have the image almost ready. Take a snapshot of it! In order to sysprep the image we need to undefine it from libvirt. If we want to make tweaks we can always come back to our snapshot. This is very important to not have to start over and for maintaining updates.  
- Shut down the VM.  
- In Virtual machine manager, click Virtual Machine > Clone.  

### Sysprep the Image
On the hypervisor, log into the terminal. We must detach the image from KVM and use the virt-sysprep tool to wipe out the specific configs of the image. To download the virt-sysprep program, install the **libguestfs-utils** package.  
`$ yum -y libguestfs-tools`  

Shut the virtual machine down.  
`$ sudo shutdown now`

List all of the images.  
`$ virsh list --all`

Sysprep the image that you plan to upload.  
`$ sysprep -d <image name>`

Once the image is sysprepped you can copy it over to the Controller node and use the **glance** or **openstack** CLI to upload the image into the glance database. It is wise to keep this virtual machine present on the hypervisor - in the future you can easily turn it on, run updates, install new packages, or make different variations of the image using this virtual machine as a template, eliminating the hassle of starting from scratch.
