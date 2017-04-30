### Calling 'http://169.254.169.254/2009-04-04/meta-data/instance-id' failed [0/120s]: unexpected error ['NoneType' object has no attribute 'status_code']

Problem: When launching instances, the instances would not join the network and were inaccessible. The instance's log would show a successful boot, however contacting the metadata service would fail 20 times then give up.  

```
CentOS Linux 7 (Core)
Kernel 3.10.0-514.2.2.el7.x86_64 on an x86_64

localhost login: [   17.238624] cloud-init[787]: Cloud-init v. 0.7.5 running 'init' at Tue, 27 Dec 2016 04:20:46 +0000. Up 17.16 seconds.
[   17.341414] cloud-init[787]: ci-info: +++++++++++++++++++++++Net device info+++++++++++++++++++++++
[   17.342699] cloud-init[787]: ci-info: +--------+------+-----------+-----------+-------------------+
[   17.343893] cloud-init[787]: ci-info: | Device |  Up  |  Address  |    Mask   |     Hw-Address    |
[   17.345104] cloud-init[787]: ci-info: +--------+------+-----------+-----------+-------------------+
[   17.346300] cloud-init[787]: ci-info: |  lo:   | True | 127.0.0.1 | 255.0.0.0 |         .         |
[   17.347499] cloud-init[787]: ci-info: | eth0:  | True |     .     |     .     | fa:16:3e:8c:0a:fb |
[   17.348690] cloud-init[787]: ci-info: +--------+------+-----------+-----------+-------------------+
[   17.349877] cloud-init[787]: ci-info: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Route info failed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
[   17.698511] cloud-init[787]: 2016-12-26 23:20:47,237 - url_helper.py[WARNING]: Calling 'http://169.254.169.254/2009-04-04/meta-data/instance-id' failed [0/120s]: unexpected error ['NoneType' object has no attribute 'status_code']
[   18.704584] cloud-init[787]: 2016-12-26 23:20:48,244 - url_helper.py[WARNING]: Calling 'http://169.254.169.254/2009-04-04/meta-data/instance-id' failed [1/120s]: unexpected error ['NoneType' object has no attribute 'status_code']
[   19.707135] cloud-init[787]: 2016-12-26 23:20:49,248 - url_helper.py[WARNING]: Calling 'http://169.254.169.254/2009-04-04/meta-data/instance-id' failed [2/120s]: unexpected error ['NoneType' object has no attribute 'status_code']
[   20.711488] cloud-init[787]: 2016-12-26 23:20:50,252 - url_helper.py[WARNING]: Calling 'http://169.254.169.254/2009-04-04/meta-data/instance-id' failed [3/120s]: unexpected error ['NoneType' object has no attribute 'status_code']
[   21.714534] cloud-init[787]: 2016-12-26 23:20:51,256 - url_helper.py[WARNING]: Calling 'http://169.254.169.254/2009-04-04/meta-data/instance-id' failed [4/120s]: unexpected error ['NoneType' object has no
```

#### Scenario 1:
This is a misconfiguration of the neutron server's keystone settings on a compute node.   

##### Solution:
In the hypervisor's neutron configuration, keystone authentication is failing because the auth_url is not pointing to the controller node, it's pointing to localhost. Below is the log that led me to know that the issue was with neutron. I was glancing through the config and noticed authentication was misconfigured. I changed the configuration to authenticate against the controller node and things started working after restarting the neutron-server service. The changes to the configuration file can be found below, as well as the warning messages in the logs.

Configuration file: /etc/neutron/neutron.server  
```
$ vim /etc/neutron/neutron.conf

[keystone_authtoken]

#auth_uri = http://127.0.0.1:35357/v2.0/
#identity_uri = http://127.0.0.1:5000
auth_uri = http://192.168.1.3/35357/v2.0
identity_uri = http://192.168.1.3:5000
admin_tenant_name = %SERVICE_TENANT_NAME%
admin_user = %SERVICE_USER%
admin_password = %SERVICE_PASSWORD%
```

#### Scenario 2:  
Check the neutron-metadata service on the network node. Make sure the service is running and logs are fresh.

##### Solution:  
Log into neutron node and restart the metadata service.  
`$ systemctl restart neutron-metadata-agent.service`
