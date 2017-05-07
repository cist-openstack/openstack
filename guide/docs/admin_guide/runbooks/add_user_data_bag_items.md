### Creating User Data Bag Items
Welcome. This runbook is going to throw a lot at you but that's the point. Hopefully it is thorough enough to follow and make sense.  
Author: Tom Neilly  
Date: 5/6/2017

##### What's a "data bag item"?
A data bag is a [JSON](https://developers.squarespace.com/what-is-json/) file that contains global variables used for Chef. The "users" data bag contains all of the instructions for Chef on how to create a user on any one of our nodes. This automates the user creation process for us.

##### What's "Chef"?
[Chef](https://www.chef.io/chef/) is a program used for automation and orchestration of multiple nodes. By creating a Chef recipe to add the users, and a data bag for the users, with data bag items in that data bag that actually contain the data for the user, we eliminate the need to ever have to manually modify those users on a node again. We can simply run our Chef recipe on the node and it will do the job for us.  

##### What's a "node"?
A node (or host) refers to any one of our servers, physical or virtual.

##### Oh, okay. So what's the data bag item for?
The data bag item will contain all of the user's information. For example, to create a user on Linux, we would use this command (ignore the "$" - this indicates that this is a command we must run in our shell):  
`$ useradd <username> -c <comment on user> -m /home/<username> -p <encrypted password> -s <path to shell> -G <additional groups user is to be a member of>`  

Example, here we are creating a user "derpo" a comment of who he is, setting his home directory to /home/derp, setting the encrypted password, ensuring derp uses the bash shell, and adding him to the "corporate" group:  
```
useradd derpo -c "Derp Derpington of Derptown" -m /home/derp -p nnjiadsfuadf###$&hdsfu -s /bin/bash -G corporate
```

##### What's a shell?  
A shell is your terminal environment, we are using the **bash** shell.

##### Why not just create the account instead of going through the hassle to make this data bag item?  
Imagine we have 60 users and they must all exist on 44 different nodes. That is an awful lot of work. This is where Chef comes in. We create a file for each user (a data bag file), then a simple recipe that reads the data from the data bag file and executes a script to create a user with that data.  

##### How do I get started?
First, you must connect to the VPN. You can find instructions on how to do this at [my.pitt.edu](http://my.pitt.edu).  

Once connected to the VPN, you must log on to our chef server (chef.snapstack.cloud / 136.142.139.154). Since we are not using a GUI, we must access our Chef server (and most other servers in our environment) with the SSH protocol.  

If you are using Windows, download [Putty.exe](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). Once putty is downloaded, execute it. Since it is a simple .exe file, you do not even need to install anything. You'll see the Putty program launch. Enter the server's IP address, keep the default SSH port of 22, and connect.  
![img/putty.png](img/putty.png)

If you are using a MAC, open a terminal and SSH to the Chef server:  
`$ ssh 136.142.139.157`  

You will be prompted for your username (use your Pitt username) and your password. You should now be connected to the Chef server.  

##### Reset your password  
Now is a good time to reset your default password if you have not. Do this using the "passwd" command.  
`$ passwd`  

Example:  
```
Changing password for thn16.
(current) UNIX password:
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

Your password should now be set. Next we need to get the hashed version of your password. This is stored in the "/etc/shadow" file.

##### How do I see the contents of a file?  
You can see the contents of a file by using several different commands but let's start with "cat". Because /etc/shadow is a protected file, we must use sudo to see it.

##### What's sudo?
The "sudo" command is how an administrative user can call commands with "root" access. The "root" user is the system's superuser account. Nothing is restricted to root.

##### Find your hashed passwd in /etc/shadow  
`$ sudo cat /etc/shadow`  

Dang, that's a lot of results and pretty messy. You really only care about your account. We can narrow the results using "grep". "grep" is a way to sort and sift through results. Let's use cat and "pipe" ( | ) it into grep for our username. A pipe simply takes the results of the last command and uses it as standard input on the next command.  
`$ sudo cat /etc/shadow | grep <your username>`

Example:  
```
$ sudo cat /etc/shadow | grep ansible
ansible:$6$3slBU8f8$W7MzBdvgfb0m/weT.Wn1MNEP6pyLv5hiQHbSUDVgTTR42/siKjE2dNp/ckiA.I/IdJwpIymOoS1Z9umGWX8XH.:17291:0:99999:7:::
```

The hashed password is the second field in the result. The fields are separated by a colon (:). Copy the hasted password somewhere for now, we'll need it in a minute.

##### Where do I Create This Data Bag File?  
First we need to fork our CIST-OpenStack repository.

##### Fork our repository??  
Using [Git](https://github.com) and the git CLI (command line interface) we are going to first clone our repository. A repository is a folder of files stored on Github's cloud. We can pull those files down from anywhere and push new files everywhere. Git is used for collaboration and versioning of files, more specifically scripts, configurations, and programs. We will store all of our own scripts, configurations, and data in Git so that it can be restored quickly and easily.

To "fork" a repository is to simply make a copy of the CIST-Openstack/openstack.git repository to your own Github account. Once the repo is forked we must "clone" our new repository. To "clone" a repository to copy the contents of the repository from Github to your local machine. Once the files are on your local machine, you can make changes, and "push" those files back up to Github, where they can eventually be "pulled" into the original repository.

- Go to the [CIST-OpenStack repository](https://github.com/cist-openstack/openstack)  
- On the top right of the screen, click "Fork". Give it a second to make the copy. Now look at the URL, notice it says "github.com/<YOUR USERNAME>/openstack"? This means you have forked the repository.
- Navigate to your home directory:  
  `$ cd`  
  That's the command to "change directory". Using "cd" by itself will change to your home directorhy (/home/<YOUR USERNAME>).  
- Clone the repository. In your browser, you should see a big green button that says, "Clone or download". Click that button and highlight the link. This is the repository we are going to clone.  
  `$ git clone <repository you just copied>`  
- List the contents of your home directory to see if it cloned correctly:  
  `$ ls`  
- You should see the **openstack** directory. This is the repository. Navigate to it.  
  `$ cd openstack`  
- Navigate to 'chef-repo/data_bags/users' and list the file contents.  

##### Create a new data bag file for yourself  
List out the contents of the _~/openstack/chef-repo/data_bags/users_ directory and you will see many .json files. Each of these is a data bag item, more specifically for the "users" data bag. You must new create a data bag item for yourself. We will do so using the **Vim** text editor. Check out this [vim cheat sheet](https://vim.rtorr.com/) which will help you understand how to use Vim.

Create a new file for yourself:  
`$ vim <username>.json`  

You must be in "insert" mode to type. Press `Shift+i`. The bottom of the screen should show "-- INSERT --". If it does not, try it again. Once in "insert" mode you may type. Here are the following contents we need in our JSON file:  

```
{
  "id": "<your username>",
  "comment": "<Full Name, this is just for notes",
  "home": "/home/<your username>",
  "shell": "/bin/bash",
  "password": "<your hashed password you copied>"
}

```

When you are done inserting the text, leave insert mode and enter "escape" mode by pressing the ESC key. Once you no longer see "-- INSERT --" at the bottom of the screen you are in escape mode. Press colon (`:`), then `wq!` and press enter. This writes the file and quits out of Vim.  
`:wq!`  

##### Check your file  
Check the contents of your file using the "cat" command. If it's good, let's push it to our Git repository.

##### Add your changes to Git  
`$ git add .`  

##### Check Git status  
Check git status to see if the file was added. If your terminal has color, it should be green.  
`$ git status`  

##### Commit your file  
Commit your file to be pushed.  
`$ git commit`  

##### Push your file  
Push your file to your repository on Github. Enter your credentials once prompted.
`$ git push`  

##### Check the repo in your browser
Refresh your browser, is the new file there? Yeah? Great job.
