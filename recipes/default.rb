#
# Cookbook Name:: cog_mysql_backup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "percona::package_repo"

node['cog_mysql_backup']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template '/root/mysqlbackup.sh' do
  action :create
  mode '0755'
  owner 'root'
  group 'root'
  source 'mysqlbackup.sh.erb'
  variables({
    :backupdest => node['cog_mysql_backup']['dest'],
    :archivedir => node['cog_mysql_backup']['archive'],
    :mailto     => node['cog_mysql_backup']['email']
    })
end

cron_d 'mysql-backup' do
  minute  node['cog_mysql_backup']['minute']
  hour    node['cog_mysql_backup'][hour]
  command '/root/myslbackup.sh'
  user    'root'
end
