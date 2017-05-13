#
# Cookbook Name:: system_users
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

search(:users, "*:*").each do |data|
 user data["id"] do
   comment data["comment"]
   home data["home"]
   shell data["shell"]
   password data["password"]
   end
end
