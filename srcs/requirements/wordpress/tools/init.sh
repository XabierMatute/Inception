#!/bin/bash

# Stop the script if any command fails
set -e

if ./wp-cli.phar core is-installed --allow-root; then
    echo "WordPress is already installed."
else
    echo "Checking variables..."

    # Check if MYSQL_DATABASE is set
    if [ -z "${MYSQL_DATABASE}" ]; then
        echo "Error: MYSQL_DATABASE is not set."
        exit 1
    fi

    # Check if MYSQL_USER is set
    if [ -z "${MYSQL_USER}" ]; then
        echo "Error: MYSQL_USER is not set."
        exit 1
    fi

    # Check if MYSQL_PASSWORD is set
    if [ -z "${MYSQL_PASSWORD}" ]; then
        echo "Error: MYSQL_PASSWORD is not set."
        exit 1
    fi

    # Check if DOMAIN_NAME is set
    if [ -z "${DOMAIN_NAME}" ]; then
        echo "Error: DOMAIN_NAME is not set."
        exit 1
    fi

    # Check if WP_ADMIN_USER is set
    if [ -z "${WP_ADMIN_USER}" ]; then
        echo "Error: WP_ADMIN_USER is not set."
        exit 1
    fi

    # Check if WP_ADMIN_PASSWORD is set
    if [ -z "${WP_ADMIN_PASSWORD}" ]; then
        echo "Error: WP_ADMIN_PASSWORD is not set."
        exit 1
    fi

    if [ -z "${WP_ADMIN_EMAIL}" ]; then
        echo "Error: WP_ADMIN_EMAIL is not set."
        exit 1
    fi

    # Check if WP_USR is set
    if [ -z "${WP_USR}" ]; then
        echo "Error: WP_USR is not set."
        exit 1
    fi

    # Check if WP_EMAIL is set
    if [ -z "${WP_EMAIL}" ]; then
        echo "Error: WP_EMAIL is not set."
        exit 1
    fi

    # Check if WP_PWD is set
    if [ -z "${WP_PWD}" ]; then
        echo "Error: WP_PWD is not set."
        exit 1
    fi

    echo "All necessary variables are set."

    # install wp-cli
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    echo "wp-cli installed"
    # make the file executable
    chmod +x wp-cli.phar
    echo "wp-cli is now executable"
    # download wordpress
    ./wp-cli.phar core download --allow-root
    echo "wordpress downloaded"

    ./wp-cli.phar --path=/var/www/html config create --url={$DOMAIN_NAME} --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --locale=es_ES --allow-root --skip-check
    echo "config created"

    # replace the database name, user and password in the wp-config.php file
    sed -i -r "s/db1/$MYSQL_DATABASE/1"   /var/www/html/wp-config.php
    sed -i -r "s/user/$MYSQL_USER/1"  /var/www/html/wp-config.php
    sed -i -r "s/pwd/$MYSQL_PASSWORD/1"    /var/www/html/wp-config.php

    # install wordpress with wp-cli
    ./wp-cli.phar core install --skip-email --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL
    echo "core installed"
    ./wp-cli.phar user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    ./wp-cli.phar user create $WP_ADMIN_USER $WP_ADMIN_EMAIL --role=administrator --user_pass=$WP_ADMIN_PASSWORD --allow-root
    echo "users created"
    ./wp-cli.phar theme install astra --activate --allow-root
    echo "astra installed"
    # ./wp-cli.phar plugin install redis-cache --activate --allow-root
    ./wp-cli.phar plugin update --all --allow-root
    echo "plugin updated"

    # Find the location of www.conf
    find /etc/php -name www.conf -print
    # change the listen directive in the php-fpm configuration file (www.conf) to listen on port 9000(nginx) (-i to edit the file in place)
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf




    # create directory for php-fpm, needed for php-fpm to run
    mkdir /run/php

    # enable redis cache (--allow-root to avoid permission issues)
    # ./wp-cli.phar redis enable --allow-root

    echo "starting php-fpm..."
    chown 777 -R /var/www/html #no dejar asi
    mv /favicon.ico /var/www/html
fi
# start php-fpm (-F to run in foreground)
/usr/sbin/php-fpm7.4 -F
echo "He ejecutao con codigo: $?"