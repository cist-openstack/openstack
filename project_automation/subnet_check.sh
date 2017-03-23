#!/bin/bash

# Subnet checking

SUBNET_ARRAY=(`neutron subnet-list -f value | awk '{print $3}'`)
NEW_SUBNET=15.15.15.0/24
for i in ${SUBNET_ARRAY[*]}; do [ $NEW_SUBNET == $i ] && echo "Uh oh, $NEW_SUBNET is already in the subnet list ($i)" && break;done;
