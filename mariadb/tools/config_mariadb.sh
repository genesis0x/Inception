#!/bin/bash

# Define your MariaDB configuration parameters
username="$DB_USER"
password="$DB_PASSWORD"
host='0.0.0.0'
port=3306
configfile="/etc/mysql/mariadb.conf.d/50-server.cnf"
name="$DB_NAME"

# Install MariaDB
apt-get install -y mariadb-server

# Start MariaDB service
service mariadb start

# Create a database
mysql -u "$username" -p"$password" -e "CREATE DATABASE IF NOT EXISTS $name;"

# Grant privileges
mysql -u "$username" -p"$password" -e "CREATE USER '$username'@'%' IDENTIFIED BY '$password';"
mysql -u "$username" -p"$password" -e "CREATE USER 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';"
mysql -u "$username" -p"$password" -e "GRANT ALL PRIVILEGES ON $name.* TO '$username'@'%';"
mysql -u "$username" -p"$password" -e "GRANT ALL PRIVILEGES ON $name.* TO 'root'@'%';"

# Modify MariaDB configuration using awk
awk -v port="$port" '
    /^bind-address/ {
        print "bind-address            = 0.0.0.0";
        next;
    }
    /^port/ {
        print "port                    = " port;
        next;
    }
    {
        print;
    }
' "$configfile" > "$configfile.tmp"

mv "$configfile.tmp" "$configfile"

# Start MariaDB service
service mariadb stop

# Start MariaDB in safe mode
mysqld_safe
