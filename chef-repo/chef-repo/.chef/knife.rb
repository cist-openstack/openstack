# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "thn16"
client_key               "#{current_dir}/thn16.pem"
chef_server_url          "https://chef.snapstack.cloud/organizations/upb"
cookbook_path            ["#{current_dir}/../cookbooks"]
