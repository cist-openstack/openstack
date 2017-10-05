# How to Add a Compute Node to OpenStack
When CentOS is installed it makes ruby repositories so that when you go to download something and other things, it points the computer to the correct place. So the first thing to do is to go onto the compute node that will be added to OpenStack and delete these repositories.

**'' are not to be put in, "" are supposed to be put in.**

### Remove Repositories on Compute Node
1. Move to the directory etc/yum.repos.d and delete all the repos there.
  - cd etc/yum.repos.d
2. Next remove all the repositories from within in this directory.
  - sudo rm /etc/yum.repos.d/'Name of Repository'  

Next you will want to log into chef in order to give the compute node, that you erased all the repositories from, a recipe that will make it operate as a node.
### Put Recipe on Compute Node From Chef
1. First bootstrap the compute node
  - cd chef-repo
  - ./bootstrap.sh 'Compute Node Name'
    - this will ask you to put the chef password in which you will get from Tom
2. Next you will add a recipe to the Compute Node
  - knife node run_list add 'Name of Node' "recipe[compute_node_base_install]"
    - You will have to put the root password in for the compute node, which you will get from Tom.
    - This can fail, because sometimes the repositories that were deleted earlier can come back, so delete the repositories again and rerun this command.
   ![Boot](img\chefFailure.jpg)  
3. Return to the compute node and run chef on it.
  - sudo chef-client
    - After chef has run through the Compute Node, it will need to be restarted in order for all the changes to be applied

Next go to Newton-Controller. The Newton-Controller will add the Controller to OpenStack.

### Adding Compute Node to OpenStack
In order to do the next part you have to have root privileges. So get permission from Tom or have him change your account to have root privileges.
1. You will need to be in the root home directory to access the file that you need to run.
  - vim answers.txt
    - This file needs to be changed to exclude all the other compute nodes that will not be changed. So in Exclude Servers make sure Newton-Controller, Newton-Network, and all compute nodes, not being added to OpenStack, are in the exclude servers part. Then in Config_Compute_Hosts, add the compute node that will be added to OpenStack.
   ![Boot](img\answersChange.jpg)
2. Now generate SSH connection to the compute node
  - ssh-keygen -R 'Compute Node Name' without the cist.pitt.edu at the end.
  - ssh-keygen -R 'Compute Node Name' with cist.pitt.edu at the end.
    - This deletes the old SSH connection to the compute node
  - ssh-copy-id 'Compute Node Name' with cist.pitt.edu at the end.
3. Now you can add the compute node to OpenStack.
  - Packstack --answer-file=/root/answers.txt
    - Once again this can fail because the repositories readded themselves on the compute node. Delete all the repositories again and sudo chef-client. Then rerun this command.
   ![Boot](img\controllerFailure.jpg)

The compute node should now be added to OpenStack. 
