#!/bin/bash
sudo fping -f /etc/telegraf/scripts/all_hosts > /tmp/ping 2> /dev/null
hosts_up=`cat /tmp/ping | grep -i alive | wc -l`
echo "{\"total_physical_hosts_up\": $hosts_up}"
rm /tmp/ping
