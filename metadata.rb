name             'cog_mysql_backup'
maintainer       'Cash On Go'
maintainer_email 'lauri.jesmin@cashongo.co.uk'
license          'All rights reserved'
description      'Installs/Configures MySQL Backup with percona xtrabackup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'

depends 'percona',    '~> 0.16.0'
depends 'cron',       '~> 1.6.1'
depends 'chef-vault', '~> 1.3.0'
depends 'python',     '~> 1.4.6'
