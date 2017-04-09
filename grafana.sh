#!/bin/env bash



wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.2.0-1.x86_64.rpm 
sudo yum -y localinstall grafana-4.2.0-1.x86_64.rpm 
wget https://dl.influxdata.com/influxdb/releases/influxdb-1.2.0.x86_64.rpm
sudo yum -y localinstall influxdb-1.2.0.x86_64.rpm
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.2.1.x86_64.rpm
sudo yum -y localinstall telegraf-1.2.1.x86_64.rpm
systemctl start influxdb
systemctl enable influxdb
systemctl start firewalld
firewall-cmd --add-port=8086/tcp --permanent
firewall-cmd --reload
influx -precision rfc3339
create database grafana
