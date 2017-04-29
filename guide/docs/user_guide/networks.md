### Creating a Network

Without a network our instances will never be acccessible, so creating a network is a critical step. There are 2 types of networks: **Public** and **Private**. Unless you are an administrator, there will be no need to ever create a public network.
- Public - A public network is a network that is physically located on the networking equipment and is shared with OpenStack. OpenStack runs an internal DHCP service that allows us to assign a "Floating IP" address to our instances to make them publicly available. The "Floating IP" is a spare IP that is on our public (phsyical) network. This floating IP is then assigned to the virtual machine's private IP via our virtual router and is essentially just doing port forwarding for us so that the outside world can communicate with our instance. We currently have a very limited amount of floating IPs.
- Private - A private network is a NAT network, exactly like your home internet. We have the ability to create these in case we want to keep our instances segregated from other networks.

By default, we will have access


### Create a Network

### Create a Subnet

### Create a Router

### Create Access Rules

### Download SSH Keys (Optional)
