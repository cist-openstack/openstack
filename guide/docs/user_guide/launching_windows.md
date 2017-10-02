# Launching a Windows Image on Snapstack
There are a few steps involved before we can launch a Windows image on Openstack.  
- Create a new keypair  
- Launch an instance
- Set our global variables to authenticate to OpenStack  
- Fetch and decrypt our password   
- Remote desktop to the instance

### Creating a keypair  
The first step we must take is creating a keypair that will be used to fetch and decrypt our randomly generated password from OpenStack.
- Log into the OpenStack dashboard and go to the "Access and Security" Tab

![openstackpanel.png](img/openstackpanel.png)
- Click "Create new keypair" and choose a name for the  file
 * It should save as a .pem file
 * Keep this file safe and be aware of its location

### Launching an instance
- On the left-hand side of the OpenStack dashboard, under the "Instances" tab, choose "launch Instance"

  ![LaunchInstance.png](img/LaunchInstance.png)
- Choose an instance name and a count of how many instances you want to Create
![InstanceDetails.png](img/InstanceDetails.png)

- Under the Sources section, choose an image from the list make sure that "Create New Volume" = "No"
![InstanceSource.png](img/InstanceSource.png)

- Under the Flavor section, select a virtual machine from the list with resources to best fit your needs
![InstanceFlavor.png](img/InstanceFlavor.png)

- Under the Networks section, make sure to select "private" from the list
![InstanceNetworks.png](img/InstanceNetworks.png)

- Under the Security Groups section, make sure that "Default" is selected
![InstanceSecurityGroups.png](img/InstanceSecurityGroups.png)

- Under the Keypair section, make sure that your created keypair is selected
![InstanceKeyPair.png](img/InstanceKeyPair.png)
- Launch your instance and wait for it to initialize
- While the instance is initializing, associate a public IP address under the "Actions" column of the "Instances" section
![AssociateAddress.png](img/AssociateAddress.png)


### Set Global Variables to Authenticate to OpenStack
- Create an SSH session with the controller node (IP address located in Github host file)
  - The SSH connection with the controller node can be completed using either WinSCP or Putty

![SshKeystone.png](img/SshKeystone.png)

 - Within your home directory, edit the file with "keystone" in its filename using Vi (the keystone file holds your authentication information)
  - Within Vi, press "i" to insert new information
- Change your username and password to reflect the authentication information used to log into the OpenStack dashboard
  -  save by pressing ESC, followed by ":wq"

![ViKeystone.png](img/ViKeystone.png)

- "Source" the keystone file, or update it, by typing in "source" followed by the filename

![SourceKeystone.png](img/SourceKeystone.png)

### Creating, Fetching, and Decrypting the Keypair on the Controller node
- NOTE: This step must be completed for each created instance using this keypair
- Find the location of the keypair created from the beginning of this guide and recreate the file on the controller node
 - Open the .pem keypair file in notepad and copy ALL of its contents
 - Create a new file with Vi on the controller node
 - paste the contents into the new file and save it as a .pem file

 ![vikeypair.png](img/vikeypair.png)
- Decrypt and fetch the keypair password on of your virtual machine Instances
 - Type "nova get-password *vmName* *NameofKeyPairFileWithFullPath* "

 ![DecryptKeyPair.png](img/DecryptKeyPair.png)

- If everything completed successfully, you should receive the decrypted passcode, which will be used as the passcode for remote Desktop

### Remote Desktop to the Instance

- Open Remote Desktop
 - Computer: publicly floating address
 - User name: Admin
 - Password: The decrypted passcode from the previous section

![RDP.png](img/RDP.png)
