### Packstack fails: django

Problem:
```
ERROR : Error appeared during Puppet run: 136.142.139.140_horizon.pp
Error: Execution of '/usr/bin/yum -d 0 -e 0 -y install openstack-dashboard' returned 1: Error: Package: 1:openstack-dashboard-8.0.1-2.el7.noarch (centos-openstack-liberty)
You will find full trace in log /var/tmp/packstack/20161029-110148-zN8Blk/manifests/136.142.139.140_horizon.pp.log
 ```

Solution:
django-horizon package was too new
deleted the package and reinstalled the package from liberty repo

`$ rpm -qa | grep -i django`
`$ yum remove <version of django>`
`$ yum install django`
