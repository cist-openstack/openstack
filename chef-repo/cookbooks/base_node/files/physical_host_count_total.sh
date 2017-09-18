#!/bin/bash
sudo /usr/sbin/fping -f /etc/telegraf/scripts/all_hosts > /tmp/ping 2> /dev/null
total_hosts=`/usr/bin/cat /etc/telegraf/scripts/all_hosts | wc -l`
rm /tmp/ping
echo "{\"total_physical_hosts\": $total_hosts}"
