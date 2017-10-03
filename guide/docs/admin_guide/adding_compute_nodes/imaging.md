# How to Image new Compute Nodes via PXE  

1. Enter the BIOS by hitting f10 while it is booting.
2. Change the boot order so that Network:MBA v10.4.6 slot 0200 is the first boot.
![Boot](img\Boot2.jpeg)
3. Exit BIOS saving the changes.
4. Upon booting, the computer go to a screen asking you to enter PXE boot menu by pressing F8. Press F8.
![Boot](img\Menu3.jpeg)
5. After pressing F8, the PXE Boot Menu will appear and have 4 options to reimage the machine. Choose the first option to Install CentOS 7 x64 With Local Repo.
![Boot](img\PXE Install 3.jpeg)
6. It will take a few minutes with a screen looking like the one below. After it is finished with this screen it will take you to the CentOS 7 install screen.  
![Boot](img\Wait3.jpeg)
7. Go through the installation steps normally. The installation should be a minimal installation, the installation Destination should be the only hard drive that is in the Compute Node, Date and Time should be Americas/New York timezone. Click install after all that is set.
![Boot](img\Select HD2.jpg)
8. Next put the root password in which will be received by who is in charge of the project.
9. After the computer reboots and is installed completely change the boot order back to Hard Drive being the first in the order in BIOS.
