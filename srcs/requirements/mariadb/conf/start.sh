#!/bin/bash

# Check if the directory doesn't exist
if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
    # Set the owner and group for the directory
    chown mysql:mysql /run/mysqld
    # Set the permissions for the directory to be more restrictive
    chmod 750 /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	envsubst '$SQL_ROOT_PASSW $SQL_USR $SQL_PASSW' < /init.sql > init_expanded.sql
    /usr/bin/mysqld --user=mysql --bootstrap < /init_expanded.sql
	rm /init_expanded.sql
fi
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql
