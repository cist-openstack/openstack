# Let's make a Kali image!
1) Install a KVM Kali Linux Graphical Desktop guest
2) Execute the "kali_desktop.sh" script
  `./kali_desktop.sh`
3) On the hypervisor, sysprep the image using the "debian_sysprep.sh" script. Debian images are wonky and this will prevent the SSH host keys from being wiped out.
