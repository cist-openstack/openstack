#!/bin/bash
sudo fping -f all_hosts > ping 2> /dev/null
hosts_up=`cat ping | grep -i alive | wc -l`
echo "{\"total_physical_hosts_up\": $hosts_up}"
rm ping
