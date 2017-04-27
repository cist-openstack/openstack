### Accessing Your project
A project has a lot of moving parts. By default, you have probably been assigned a specific set of resources - but you are not ready to play just yet. Creating a functional project requires a bit of work beyond what the administrator has performed for you, but the beauty in OpenStack is that you can do it all yourself from anywhere you please. The backend is configured so that you can create your own networks, subnets, routers, firewall rules, SSH keys, allocate disk, memory, and CPU, and launch different operating systems without ever having to physically interact with the hardware. But first you must have an account! If you already have an account, proceed to the next steps. If you still need to be allocated a user account and project, please contact the CIST-OpenStack team at **cist.openstack@gmail.com**.

### I Have My Account - Now What?  

Pitt's OpenStack instance, also known as **SnapStack** can be accessed at http://snapstack.cloud. You must be on campus or connected to the VPN in order to access the dashboard. Log in using the credentials supplied to you by the CIST-OpenStack Administrator who provisioned your account.  

### Explore the Dashboard  

Before we can do anything, it's best to get familiar with the dashboard so that we have a general idea of where things are, what we can do, and how to do it. Once you're logged in, check out the navbar on the left side. From top to bottom, let's expand these tabs to get an idea of what we can do.  

#### Project
Clicking the "Project" tab will display the three main components of every project; Compute, Network, and Object Store.  

##### Compute
This is where you manage your core resources - such as your instances, storage, and security.

- **Overview:** Shows your project's usage versus your quota.
- **Instances:** This is where your virtual machines are launched, deleted, edited, etc.
- **Volumes:** Volumes are attachable virtual disks for your instances.
- **Images:** Images are the deployable operating systems that you can use to spin up new virtual machines.  
- **Access and Security:** Used for managing firewall rules and SSH key-pairs.

##### Network
If you guessed this is where you manage your network(s), you win.

- **Network Topology:** A map of your network.  
- **Networks:** These are your private and public networks. Public networks are networks that have the ability to talk directly to the internet, which we have a very scarce amount of IP addresses for. Private networks are NAT networks, which are exactly like your home network or public WiFi - you can reach the internet using a private network but the internet cannot reach you directly. You can create multiple private networks for testing and make them as large as you like (but remember, you can only make so many instances.)  
- **Routers:** Virtual routers for your networks to attach to. Routers of course are necessary to allow your network(s) to talk to other networks.

##### Object Store
- **Containers:** Containers are pseudo-folders that you can store objects in to be accessed by your instances. An "object" is just a file - it can be a document, a PDF, an MP3, and so on. These are retrieved using a REST API - every object has a URL assigned to it and can be downloaded using utilities such as Linux's "wget", PowerShell's "Invoke-WebRequest", or by visiting the URL and letting your browser prompt you to save the object.  

#### Admin
The Admin section shows information on all projects and the actual OpenStack nodes.  

##### System
- **Overview:** A usage summary of your project versus your quota.  
- **Resource Usage:** A detailed analysis with statistics of all of the projects that you have administrative access over.  
- **Hypervisors:** A detailed analysis of all of OpenStack's hypervisors. This breaks down the total and available resources of each compute node. *Compute nodes are where our instances live - they are simply hypervisors that get told what to do by the controller node, using the network node to communicate, perform DHCP, and pull metadata for instances.*  
- **Host Aggregates:** Statistics on the different availability-zones and the nodes in them.  
- **Instances:** All instances of all projects that you have administrative access over and which hypervisor they are on. This is incredibly useful for troubleshooting specific instances that are malfunctioning.
- **Volumes:** All volume information.  
- **Flavors:** All flavor information. A "flavor" is a pre-determined set of RAM, CPU, disk, and swap. When creating instances, you will always choose a flavor which decides how big or small the instance is, ultimately deciding where and how your resources will be allocated. Flavors can be created quickly to give you more flexibility when assigning resources to your instances.  
- **Images:** All images across all projects. Images can be created and edited here; for example, if an image is 8GB in size, it is wise to set a minimum disk size for the image of 10GB+ - these defaults can be changed here.
- **Networks:** All networks for all projects.  
- **Routers:** All routers for all projects.  
- **Defaults:** Default quota size for all new projects.
- **Metadata:** Special metadata that can be injected into an instance for deeper customizations.
- **System Information:** Services that are running and the state those services are in. Great for troubleshooting.

#### Identity
Used for managing projects and users.  

- **Projects:** All aspects of projects can be managed here; such as project name, quotas, members, access, and so on.  
- **Users:** All aspects of users can be managed here; such as access, passwords, names, and so on.

### Switching Projects and Tweaking User Settings

#### Switching Projects
On the top left-center of the screen you will see a tab that has the name of your project. If you are a member of any other projects you can toggle between them here.  

#### Tweaking User Settings
On the top right of the screen you will see a tab that has your user name. You can click the dropdown menu for the user settings and to log out.
