default['cog_mysql_backup']['dest'] = '/backup'
default['cog_mysql_backup']['archive'] = '/archive'
default['cog_mysql_backup']['email'] = 'root@localhost'
default['cog_mysql_backup']['email_from'] = nil
default['cog_mysql_backup']['packages'] = ['qpress','mailx','percona-xtrabackup','time']
default['cog_mysql_backup']['hour'] = 1
default['cog_mysql_backup']['minute'] = 0

default['cog_mysql_backup']['s3url'] = 's3://cashongo-dev-mysql-archive/'

default['cog_mysql_backup']['aws_credentials_vault']  = 'cog_mysql_backup'
default['cog_mysql_backup']['aws_credentials_item']   = 'secrets'

default['cog_mysql_backup']['backup_databases'] = nil
