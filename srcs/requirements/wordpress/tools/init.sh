#!/bin/bash

# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# make the file executable
chmod +x wp-cli.phar
# download wordpress
wp-cli.phar core download --allow-root

# install wordpress with wp-cli
wp-cli.phar core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp-cli.phar user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
wp-cli.phar theme install astra --activate --allow-root
wp-cli.phar plugin install redis-cache --activate --allow-root
wp-cli.phar plugin update --all --allow-root

# change the listen directive in the php-fpm configuration file (www.conf) to listen on port 9000(nginx) (-i to edit the file in place)
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf


# replace the database name, user and password in the wp-config.php file
sed -i -r "s/db1/$db_name/1"   /var/www/html/wp-config.php
sed -i -r "s/user/$db_user/1"  /var/www/html/wp-config.php
sed -i -r "s/pwd/$db_pwd/1"    /var/www/html/wp-config.php

# create directory for php-fpm, needed for php-fpm to run
mkdir /run/php

# enable redis cache (--allow-root to avoid permission issues)
wp-cli.phar redis enable --allow-root

# start php-fpm (-F to run in foreground)
/usr/sbin/php-fpm7.3 -F