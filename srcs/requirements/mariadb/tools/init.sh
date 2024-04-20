#!/bin/bash

# start mysql
service mysql start

# create database and user
mysql -u root < /tmp/init.sql


rm /tmp/init.sql

# stop mysql
service mysql stop

# start mysql in the background
mysqld --bind-address=0.0.0.0