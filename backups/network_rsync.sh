#!/bin/bash


# If the lockfile exists, exit
if [ -e "/tmp/.tom_raid_lock" ]; then
 echo -e >> /var/log/backup.log
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][FAIL] Cannot start backup when /tmp/.tom_raid_lock exists" >> /var/log/backup.log
 exit 1
else
 # Create a lockfile
 touch /tmp/.tom_raid_lock
 echo -e >> /var/log/backup.log
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Backup for `hostname` started" >> /var/log/backup.log

 # Starting backup of /
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Starting / backup" >> /var/log/backup.log
 # Exclude temporary file systems, other backups, and /etc/fstab - we have a unique /etc/fstab in case we must boot to the backup disk
 rsync -aAXv --delete  --exclude={"/var/log/","/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/","/srv/","/lost+found","/home/"} / derpy:/home/backups/network_backup

 if [ "`echo $?`" == "0" ]; then
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][SUCCESS] / backed up!" >> /var/log/backup.log
 else
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][FAIL] Uh oh, / did not back up" >> /var/log/backup.log
 fi


 # Finished
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Backup for `hostname` completed" >> /var/log/backup.log
 rm /tmp/.tom_raid_lock
fi
