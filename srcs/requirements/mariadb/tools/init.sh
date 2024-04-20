#!/bin/bash

# start mysql
service mysql start

#create init.sql
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;
FLUSH PRIVILEGES ;
" > /tmp/init.sql

# create database and user
mysql -u root < /tmp/init.sql


rm /tmp/init.sql

# stop mysql
service mysql stop

# start mysql in the background
mysqld --bind-address=0.0.0.0