#!/bin/bash
mkdir -p /var/www/backup/
usr=root
pass=root
mysql -e 'show databases'|grep -v information_schema|grep -v Database > dblist
while read db
do
mysqldump -u$usr -p$pass $db > /var/www/backup/$db.sql
done < ./dblist


