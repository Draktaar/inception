#!/bin/bash

if [ ! -e /var/lib/mysql/.firstmount ];then
    mysql_install_db
        --datadir=/var/lib/mysql \
        --skip-test-db \
        --user=mysql \
        --group=mysql \
        --auth-root-authentication-method=socket \
        >/dev/null 2>/dev/null
    mysqld_safe &
    mysqld_pid=$!

    mysqladmin ping -u root --silent --wait >dev/null 2>/dev/null
    cat << EOF | mysql --protocol=socket -u root
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

    mysqladmin shutdown
    touch /var/lib/mysql/.firstmount
fi

exec mysqld_safe