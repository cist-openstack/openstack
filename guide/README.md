# Make changes HERE in the repo
Once changes are made, copy everything to /var/www/html/guide

`$ scp -r /root/openstack/guide/ help.snapstack.cloud:/var/www/html/`  
`$ ssh help.snapstack.cloud`
`$ cd /var/www/html/guide`  
`$ mkdocs build`  
