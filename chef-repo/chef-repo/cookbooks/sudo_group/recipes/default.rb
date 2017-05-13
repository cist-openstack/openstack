#
# Cookbook Name:: sudo_group
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
search(:groups, '*:*').each do |data|
  group data['id'] do
    action :modify
    members data['members']
    append true
  end
end

cookbook_file '/etc/sudoers' do
  source 'sudoers'
  action :create
end
