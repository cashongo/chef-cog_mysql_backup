cog_mysql_backup Cookbook
=========================
This cookbook installs /root/myslbackup.sh script, which takes one monthly full and
daily incremental backups from mysql with percona xtrabackup tool.


Requirements
------------
* Percona repo, so it can install percona xtrabackup and qpress.
* AWS CLI, this cookbook does not install it itself. Amazon linux comes preloaded
anyway.

#### packages
- `mailx` - mail client for sending reports
- `qpress` - backup compression/uncompression tool
- `percona-xtrabackup` - backup tool

Attributes
----------
#### cog_mysql_backup::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['dest']</tt></td>
    <td>String</td>
    <td>Where to store backups</td>
    <td><tt>/backup</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['archive']</tt></td>
    <td>String</td>
    <td>Where to store retired backups</td>
    <td><tt>/archive</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['aws_credentials_vault']</tt></td>
    <td>String</td>
    <td>AWS Credentials vault name</td>
    <td><tt>cog_mysql_backup</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['aws_credentials_item']</tt></td>
    <td>String</td>
    <td>AWS Credentials item name</td>
    <td><tt>secrets</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['s3url']</tt></td>
    <td>String</td>
    <td>S3 URL for backup archiving</td>
    <td><tt>s3://cashongo-dev-mysql-archive/</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['s3url_incr']</tt></td>
    <td>String</td>
    <td>S3 URL for incremental backups</td>
    <td><tt>s3://cashongo-dev-mysql-backup/</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['hour']</tt></td>
    <td>Integer</td>
    <td>Hour for running backup</td>
    <td><tt>1</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['minute']</tt></td>
    <td>Integer</td>
    <td>Minute for running backup</td>
    <td><tt>0</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['backup_databases']</tt></td>
    <td>Array of Strings</td>
    <td>Databases to be backed up. If empty, all are backed up</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----
#### cog_mysql_backup::default

Create a AWS user and create access credentials to specified Chef Vault (by default
'cog_mysql_backup','secrets' )

This is bucket structure, replace AWSKEY and AWSSECRET with your credentials:

```json
{
  "aws_key":"AWSKEY",
  "aws_secret":"AWSSECRET"
}

```

Set AWS S3 url to correct location.

Include `cog_mysql_backup` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cog_mysql_backup]"
  ]
}
```
