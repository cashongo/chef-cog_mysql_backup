#
# Cookbook Name:: cog_mysql_backup
# Recipe:: default
#
# Copyright 2015, Cash On Go
#
# All rights reserved - Do Not Redistribute
#

include_recipe "percona::package_repo"

node['cog_mysql_backup']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

[node['cog_mysql_backup']['dest'],node['cog_mysql_backup']['archive']].each do |x|
  directory x do
    owner 'root'
    group 'root'
    mode '0700'
    action :create
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
    :mailto     => node['cog_mysql_backup']['email'],
    :mailfrom   => node['cog_mysql_backup']['email_from']
    })
end

cron_d 'mysql-backup' do
  minute  node['cog_mysql_backup']['minute']
  hour    node['cog_mysql_backup']['hour']
  command '/root/mysqlbackup.sh'
  user    'root'
end
