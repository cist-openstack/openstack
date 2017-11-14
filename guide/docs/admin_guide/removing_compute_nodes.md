# Removing a Compute Node
If a compute node needs to be re-imaged or replaced, we must properly delete it from the Nova database. 

Log into the MySQL database:  
`$ sudo mysql -u root`  

Use the nova database:  
`> use nova;`  

Delete the compute node from the "compute_nodes" table:  
`> delete from compute_node where hypervisor_hostname="<compute node>"`  

Delete the compute node from the "services" table:  
`> delete from services where host="<compute node>"`  

If you are using the dashboard, refresh the page; the compute node should be removed from the list of hypervisors. 
