default['cog_mysql_backup']['dest'] = '/backup'
default['cog_mysql_backup']['archive'] = '/archive'
default['cog_mysql_backup']['email'] = 'root@localhost'
default['cog_mysql_backup']['packages'] = ['qpress','mailx','percona-xtrabackup']
default['cog_mysql_backup']['hour'] = 1
default['cog_mysql_backup']['minute'] = 0
