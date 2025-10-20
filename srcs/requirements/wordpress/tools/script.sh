#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

# Configure PHP-FPM on the first run
if [ ! -e /etc/.firstrun ]; then
    sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
    touch /etc/.firstrun
fi

if [ ! -e .firstmount ]; then
    mariadb-admin ping --protocol=tcp --host=mariadb -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" --wait >/dev/null 2>/dev/null

    # Check if WordPress is already installed
    if [ ! -f wp-load.php ]; then
        echo "Installing WordPress..."

        # Download and configure WordPress
        wp core download --allow-root || true
        wp core install --allow-root \
            --skip-email \
            --url="$DOMAIN_NAME" \
            --title="$WORDPRESS_TITLE" \
            --admin_user="$WORDPRESS_ADMIN_USER" \
            --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
            --admin_email="$WORDPRESS_ADMIN_EMAIL"

    else
        echo "WordPress is already installed."
    fi
    chmod o+w -R /var/www/html/wp-content
    touch .firstmount
fi

# Start PHP-FPM
exec /usr/sbin/php-fpm8.2	 -F