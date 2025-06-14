#!/bin/bash

# Stop the script if any command fails
set -e

echo "checking variables"
# Verificar que las variables de entorno estén establecidas
if [ -z "$MYSQL_DATABASE" ]; then
    echo "Error: MYSQL_DATABASE is not set"
    exit 1
fi

if [ -z "$MYSQL_USER" ]; then
    echo "Error: MYSQL_USER is not set"
    exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
    echo "Error: MYSQL_PASSWORD is not set"
    exit 1
fi

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo "Error: MYSQL_ROOT_PASSWORD is not set"
    exit 1
fi
echo "variables checked!"

#create init.sql
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;
FLUSH PRIVILEGES ;
" > /tmp/XMinit.sql

echo "XMinit.sql created"

# start mysql 
mysqld --bind-address=0.0.0.0 --init-file=/tmp/XMinit.sql 
