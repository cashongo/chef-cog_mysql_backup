cog_mysql_backup Cookbook
=========================
This cookbook installs /root/myslbackup.sh script, which takes 1 montly full and
daily incremental backups from mysql with percona xtrabackup tool.


Requirements
------------
Percona repo, so it can install percona xtrabackup and qpress.


#### packages
- `mailx` - mail client for sending raports
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
    <td><tt>['cog_mysql_backup']['email']</tt></td>
    <td>String</td>
    <td>Address for reports</td>
    <td><tt>root@localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['hour']</tt></td>
    <td>Integer</td>
    <td>Hour for runnign backup</td>
    <td><tt>1</tt></td>
  </tr>
  <tr>
    <td><tt>['cog_mysql_backup']['minute']</tt></td>
    <td>Integer</td>
    <td>Minute for running backup</td>
    <td><tt>0</tt></td>
  </tr>
</table>

Usage
-----
#### cog_mysql_backup::default

Just include `cog_mysql_backup` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cog_mysql_backup]"
  ]
}
```
