#!/bin/bash
sudo /usr/sbin/fping -f /etc/telegraf/scripts/all_hosts > /tmp/ping 2> /dev/null
hosts_up=`cat /tmp/ping | grep -i alive | wc -l`
rm /tmp/ping
echo "{\"total_physical_hosts_up\": $hosts_up}"
