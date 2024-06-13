#!/bin/bash

# MySQL root password
read -sp "Mot de passe Root: " mysql_root_password

# Loop over each database
for db in "${databases[@]}"; do
    # Create database
    mysql -uroot -p"${mysql_root_password}" -e "CREATE DATABASE IF NOT EXISTS ${db['name']};"

    # Check if user exists
    user_exist=$(mysql -uroot -p"${mysql_root_password}" -e "SELECT user FROM mysql.user WHERE user='${db['user']}'" | grep -c "${db['user']}")

    if [ $user_exist -ne 0 ]; then
        echo "User ${db['user']} already exists"
    else
        # Create user
        mysql -uroot -p"${mysql_root_password}" -e "CREATE USER '${db['user']}'@'localhost' IDENTIFIED BY '${db['password']}';"
        mysql -uroot -p"${mysql_root_password}" -e "GRANT ALL PRIVILEGES ON ${db['name']}.* TO '${db['user']}'@'localhost';"
        mysql -uroot -p"${mysql_root_password}" -e "FLUSH PRIVILEGES;"
        echo "User ${db['user']} created and granted privileges for database ${db['name']}"
    fi
done
