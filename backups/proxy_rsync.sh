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

 # Starting backup of /etc/httpd/
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Starting /etc/httpd/ backup" >> /var/log/backup.log
 rsync -aAXv --delete /etc/httpd/ derpy:/home/backups/proxy_backup/

 if [ "`echo $?`" == "0" ]; then
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][SUCCESS] /etc/httpd/ backed up!" >> /var/log/backup.log
 else
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][FAIL] Uh oh, /etc/httpd/ did not back up" >> /var/log/backup.log
 fi

 # Finished
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Backup for `hostname` completed" >> /var/log/backup.log
 rm /tmp/.tom_raid_lock
fi
