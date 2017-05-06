### No traffic to Virtual Machine

On the hypervisor, check the **/prod/sys/net/bridge** settings. These files simply hold a 1 or a 0. All of the files must be set to 0 to allow the virtual machines to have traffic.

```
$ cd /proc/sys/net/bridge/
$ ls
bridge-nf-call-arptables bridge-nf-call-ip6tables bridge-nf-call-iptables bridge-nf-filter-pppoe-tagged bridge-nf-filter-vlan-tagged bridge-nf-pass-vlan-input-dev
```
