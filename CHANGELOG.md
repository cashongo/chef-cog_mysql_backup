### 0.4.0 (2016-02-08)
- Send logs to syslog instead of e-mailing them

### 0.3.2 (2015-12-30)
- add some quoting to backup script

### 0.3.1 (2015-12-23)
- fix limited databases separator

### 0.3.0 (2015-12-21)
- option to limit backup by databases

### 0.2.3 (2015-11-26)
- Aws credentials are sensitive
- Remove extra / from AWS s3 URL

### 0.2.2 (2015-11-25)
- Aws s3 upload fix
- Documentation update

### 0.2.1 (2015-11-13)
- Install AWS CLI if not installed
- Install time package with mysql_backup

### 0.2.0 (2015-11-04)
- Move old backups to AWS archive and use AWS server side encryption
- Chef Vault with access keys is now required

### 0.1.8 (2015-10-29)

- updated script for xtrabackup 2.3
- a bit more output to email

### 0.1.7 (2015-07-30)

- Add possibility to disable backups

### 0.1.6

- Add rsync time also to content of email
- Reformat Changelog

### 0.1.5

- add backup time to content of email.

### 0.1.4

- Move failed full backups after detecting failure to different directory
- Add email_from attribute to set sender address
