#!/bin/bash
count=`sudo virsh list --all | grep [0-9] | wc -l`
echo "{\"instance_count\": $count}"

