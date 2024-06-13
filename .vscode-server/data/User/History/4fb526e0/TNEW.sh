#!/bin/bash

# Loop through databases and create them
mysql -e "CREATE DATABASE IF NOT EXISTS "${ item.name }";" -u root -p"${mysql_root_password}"

# Loop through users, check if exists and create if not
user_exists=$(mysql -sN -e "SELECT user FROM mysql.user WHERE user='"${ item.name }"';" -u root -p"${mysql_root_password}")
if [ -z "$user_exists" ]; then
    mysql -e "CREATE USER IF NOT EXISTS '"${ item.user }"'@'localhost' IDENTIFIED BY 'JvDq5Ksg';" -u root -p"${mysql_root_password}"
    mysql -e "GRANT ALL PRIVILEGES ON "${ item.name }".* TO '"${ item.name }"'@'localhost';" -u root -p"${mysql_root_password}"
else
    echo "User "${ item.user }" already exists"
fi
