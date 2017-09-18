#!/bin/bash
echo "Chef password?"
read -s pw
ssh $1 "sudo rm /etc/yum.repos.d/*"
sudo scp /root/chef-repo/cookbooks/base_node/files/all.repo $1:/etc/yum.repos.d/
sudo scp /root/chef-repo/cookbooks/base_node/files/hosts $1:/etc/hosts
ssh $1 "sudo yum -y install chefdk"
knife bootstrap -x thn16 -P $pw -c /root/chef-repo/.chef/knife.rb -N $1 --sudo root@$1
knife node run_list add $1 "role[base_node]"
