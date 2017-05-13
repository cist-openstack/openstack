#!/bin/bash
sudo fping -f all_hosts > ping 2> /dev/null
total_hosts=`cat all_hosts | wc -l`
echo "{\"total_physical_hosts\": $total_hosts}"
rm ping
