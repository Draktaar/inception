#!/bin/bash

service mysql start

mysql -e "CREATE A DATABASE IF NOT EXISTS ${MYSQL_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "ALTER USER '-u${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld_safe