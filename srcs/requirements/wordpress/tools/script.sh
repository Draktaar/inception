#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

if [ ! -e /etc/.firstrun ]; then
    sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
    touch /etc/.firstrun
fi

if [ ! -e .firstmount ]; then
	sleep 10

    if [ ! -f wp-load.php ]; then
        wp core download --allow-root
		wp config create --allow-root \
			--dbhost=mariadb \
			--dbname="$MYSQL_DATABASE" \
			--dbuser="$MYSQL_USER" \
			--dbpass="$MYSQL_PASSWORD"
        wp core install --allow-root \
            --skip-email \
            --url="$DOMAIN_NAME" \
            --title="$WORDPRESS_TITLE" \
            --admin_user="$WORDPRESS_ADMIN_USER" \
            --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
            --admin_email="$WORDPRESS_ADMIN_EMAIL"
    fi
    chmod o+w -R /var/www/html/wp-content
    touch /etc/.firstmount
fi

# Start PHP-FPM
exec /usr/sbin/php-fpm8.2 -F