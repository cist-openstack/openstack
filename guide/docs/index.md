# CIS&T OpenStack

### Welcome
Welcome to the Computer Information Systems and Technology's OpenStack at the University of Pittsburgh at Bradford. This project is an educational use case to show the benefits of flexible, private cloud computing. The overall project is utilizing a plethora of different technologies and there are roughly 44 physical nodes that make up our instance. Beyond just setting up a cloud, one of the main goals of this project is to enforce a "code as an infrastructure" environment, with automation always at the forefront of the changes that are made. Code as an infrastructure allows us to quickly recover from a catastrophic event or to scale horizontally with ease. This is achieved with tools like Ansible and Git, with plans to expand this idea further with Jenkins, Chef, and Screwdriver.

### Our Setup  
- Dell PowerEdge R510 and HP Proliant servers make up the physical hardware.
- CentOS 7 Linux is the Operating System that everything runs on.  
- Kernel Based Virtual Machines (KVM) is the virtualization layer.  
- OpenStack and all of its components (Nova, Neutron, Glance, Horizon, Swift, Keystone) make up the virtualization management and cloud layer.  
- OpenvSwitch is the underlying software defined network.
- MySQL is the database for the backend OpenStack components.  
- Apache is used for the reverse proxying of all websites and student projects.
- Ansible is the continuous deployment tool that is used for concurrent node management.  
- Telegraf is the metric collector used for gathering information on the nodes for monitoring.  
- InfluxDB is the time-series database used for storing the metrics collected by Telegraf.  
- Grafana is the web-based graphing program that is used for monitoring and alerting.
- Git is used for our version management.

### A Guide to the Guides
- Check out [OpenStack's website](https://www.openstack.org/) to learn more about OpenStack. This is not a comprehensive guide to OpenStack, this is a guide for our specific use case.  
- Check out the [User Guide](http://help.snapstack.cloud/user_guide/getting_started/) if you are looking to get started with using OpenStack.  
- Check out the [Admin Guide](http://help.snapstack.cloud/admin_guide/getting_started) if you are helping with the project or have interest in how some of the backend is handled.  
- Check out our [Github repository](https://github.com/cist-openstack/openstack.git) to see all of our OpenStack related code, this guide included!
- Check out our [Grafana monitoring dashboard](http://grafana.snapstack.cloud/dashboard/db/cpu?refresh=1m&orgId=2) to see how our stack is holding up.
