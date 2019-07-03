#!/bin/bash
# Database credentials
user="testuser"
password="P@ssw0rd"
host="localhost"
db_name="testdb"
# Other options
backup_path="/home/devops/backup/DB"
date=$(date +"%d-%b-%Y-%H%M%S")
# Set default file permissions
umask 177
# Dump database into SQL file
mysqldump --user=$user --password=$password --host=$host $db_name >$backup_path/$db_name-$date.sql

# Delete files older than 30 days
find $backup_path/* -mtime +30 -exec rm {} \;


#DB backup log
echo -e "$(date +'%d-%b-%y  %r '):ALERT:Database has been Backuped"    >>/var/log/DB_Backup.log
