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

 # Starting backup of /opt/atlassian/
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Starting /opt/atlassian backup" >> /var/log/backup.log
 # Exclude temporary file systems, other backups, and /etc/fstab - we have a unique /etc/fstab in case we must boot to the backup disk
 rsync -aAXv --delete /opt/atlassian/ derpy:/home/backups/docs_backup/

 if [ "`echo $?`" == "0" ]; then
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][SUCCESS] /opt/atlassian/ backed up!" >> /var/log/backup.log
 else
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][FAIL] Uh oh, /opt/atlassian/ did not back up" >> /var/log/backup.log
 fi

 # Starting backup of /var/atlassian/
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Starting /var/atlassian backup" >> /var/log/backup.log
 # Exclude temporary file systems, other backups, and /etc/fstab - we have a unique /etc/fstab in case we must boot to the backup disk
 rsync -aAXv --delete /var/atlassian/ derpy:/home/backups/docs_backup/

 if [ "`echo $?`" == "0" ]; then
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][SUCCESS] /var/atlassian/ backed up!" >> /var/log/backup.log
 else
  echo "[`date | awk {'print $2$3" " $4" " $6'}`][FAIL] Uh oh, /var/atlassian/ did not back up" >> /var/log/backup.log
 fi


 # Finished
 echo "[`date | awk {'print $2$3" " $4" " $6'}`][INFO] Backup for `hostname` completed" >> /var/log/backup.log
 rm /tmp/.tom_raid_lock
fi
