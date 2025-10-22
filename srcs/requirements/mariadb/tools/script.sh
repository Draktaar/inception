#!/bin/bash

if [ ! -e /var/lib/mysql/.firstmount ];then
    mysqld_safe &

    mysqladmin ping -u root --silent --wait >dev/null 2>/dev/null

    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -e "FLUSH PRIVILEGES;"

    mysqladmin shutdown
    touch /var/lib/mysql/.firstmount
fi

exec mysqld_safe