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

directory "/home/atd20" do
  owner "atd20"
  group "atd20"
  mode 00700
  action :create
end

directory "/home/dre15" do
  owner "dre15"
  group "dre15"
  mode 00700
  action :create
end

directory "/home/ellison" do
  owner "ellison"
  group "ellison"
  mode 00700
  action :create
end

directory "/home/lewicki" do
  owner "lewicki"
  group "lewicki"
  mode 00700
  action :create
end

directory "/home/sellison" do
  owner "sellison"
  group "sellison"
  mode 00700
  action :create
end

directory "/home/thn16" do
  owner "thn16"
  group "thn16"
  mode 00700
  action :create
end

directory "/home/xud4" do
  owner "xud4"
  group "xud4"
  mode 00700
  action :create
end

directory "/home/zsm5" do
  owner "zsm5"
  group "zsm5"
  mode 00700
  action :create
end
