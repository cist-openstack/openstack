#!/bin/bash

# Ensure SUM variable starts at 0
SUM=0

# Set credentials
unset OS_SERVICE_TOKEN
export OS_USERNAME=admin
export OS_PASSWORD=Panther$
export OS_AUTH_URL=http://136.142.139.133:5000/v2.0
export PS1='[\u@\h \W(keystone_admin)]\$ '

export OS_TENANT_NAME=admin
export OS_REGION_NAME=RegionOne

# Get all project names other than admin
PROJECT_ARRAY=(`openstack project list -f value | egrep -v 'admin|services|demo' | awk '{print $2}'`)

# Get total RAM
TOTAL_RAM=`nova hypervisor-stats | grep memory_mb | grep -v used | awk '{print $4}'`

# Get RAM from all projects other than admin
for i in ${PROJECT_ARRAY[*]}; do SUM=`expr $SUM + \`openstack quota show $i | egrep 'ram' | awk '{print $4}'\``; done;

# Get unallocated RAM
UNALLOCATED_RAM=`expr $TOTAL_RAM - $SUM`

echo "Total RAM available on all hypervisors: $TOTAL_RAM"
echo "Total RAM that is allocated to all projects: $SUM"
echo "Unallocated RAM: $UNALLOCATED_RAM"
echo -e "Setting the rest of the unallocated RAM to the Admin quota"

# Give all unallocated ram to admin project
openstack quota set --ram $UNALLOCATED_RAM admin

echo -e "Gave admin project $UNALLOCATED_RAM MB of RAM"
