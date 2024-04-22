#!/bin/bash

# start mysql
mysql

#create init.sql
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;
FLUSH PRIVILEGES ;
" > /tmp/init.sql

echo "init.sql created"


# create database and user
mysql -u root < /tmp/init.sql

echo "Database: $MYSQL_DATABASE created"

# remove the file
rm /tmp/init.sql

# stop mysql
mysql -u root -e "SHUTDOWN"

# start mysql in the background
mysqld --bind-address=0.0.0.0
