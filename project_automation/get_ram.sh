#/bin/bash

# Set admin project ID
ADMIN="f2734a21c74e4c4a98111a09dcfb1825"

# Set credentials
source ~/keystonerc_admin

# Get all project names other than admin
PROJECT_ARRAY=(`openstack project list -f value | egrep -v 'admin|services|demo' | awk '{print $2}'`)

get_ram() 
{
  # Get total RAM
  TOTAL_RAM=`nova hypervisor-stats | grep memory_mb | grep -v used | awk '{print $4}'`
  # Get RAM from all projects other than admin
  for i in ${PROJECT_ARRAY[*]}; do SUM=`expr $SUM + \`openstack quota show $i | egrep 'ram' | awk '{print $4}'\``; done;
  # Get unallocated RAM
  UNALLOCATED_RAM=`expr $TOTAL_RAM - $SUM`
  echo $UNALLOCATED_RAM
}

get_cpu() 
{
  # Get total CPUs
  TOTAL_CPUS=`nova hypervisor-stats | grep vcpus | grep -v used | awk '{print $4}'` 
  # Get CPUs from all projects other than admin
  for i in ${PROJECT_ARRAY[*]}; do CPU_SUM=`expr $CPU_SUM + \`openstack quota show $i | egrep 'cores' | awk '{print $4}'\``; done;
  # Get unallocated RAM
  UNALLOCATED_CPUS=`expr $TOTAL_CPUS - $CPU_SUM`
  echo $UNALLOCATED_CPUS
}

get_disk()
{
  # Get total CPUs
  TOTAL_DISK=`nova hypervisor-stats | grep local_gb | grep -v used | awk '{print $4}'`
  # Get CPUs from all projects other than admin
  for i in ${PROJECT_ARRAY[*]}; do DISK_SUM=`expr $DISK_SUM + \`openstack quota show admin | egrep 'gigabytes' | egrep -v 'backup|volume|iscsi' | awk '{print $4}'\``; done;
  # Get unallocated RAM
  UNALLOCATED_DISK=`expr $TOTAL_DISK - $DISK_SUM`
  echo $UNALLOCATED_DISK
}

# Starting script - get ram, get cpus, get disk, set quota
echo " ********** Gathering RAM **********"
RAM=`get_ram`
echo " ********** Gathering CPUs *********"
CPU=`get_cpu`
echo " ********** Gathering Disk *********"
DISK=`get_disk`
echo $RAM
echo $CPU
echo $DISK
openstack quota set --ram=$RAM --cores=$CPU --gigabytes=$DISK $ADMIN
echo "Gave admin project $RAM MB of RAM"
echo "Gave admin project $CPU vCPUs"
echo "Gave admin project $DISK gigs of disk"
openstack quota show $ADMIN
