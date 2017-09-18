#!/bin/bash
echo "Chef password?"
read -s pw
knife bootstrap -x thn16 -P $pw -c /root/chef-repo/.chef/knife.rb -N $1 --sudo root@$1
knife node run_list add $1 "role[base_node]"
