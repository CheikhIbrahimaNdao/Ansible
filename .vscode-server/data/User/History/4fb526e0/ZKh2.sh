#!/bin/bash

# Chemin vers le playbook Ansible
PLAYBOOK_PATH="/home/ndao/mysql_setup/sql_setup.yml"

# Exécution du playbook Ansible
ansible-playbook "$PLAYBOOK_PATH" --ask-become-pass

# Loop through databases and create them
for db_item in "${databases[@]}"; do
    db_name=$(echo "$db_item" | cut -d' ' -f2)
    mysql -e "CREATE DATABASE IF NOT EXISTS $db_name;" -u root -p"${mysql_root_password}" >/dev/null 2>&1
done

# Loop through users, check if exists and create if not
for user_item in "${databases[@]}"; do
    user=$(echo "$user_item" | cut -d' ' -f4)
    password=$(echo "$user_item" | cut -d' ' -f6)
    db_name=$(echo "$user_item" | cut -d' ' -f2)

    user_exists=$(mysql -sN -e "SELECT user FROM mysql.user WHERE user='$user';" -u root -p"${mysql_root_password}" 2>/dev/null)
    
    if [ -z "$user_exists" ]; then
        mysql -e "CREATE USER IF NOT EXISTS '$user'@'localhost' IDENTIFIED BY '$password';" -u root -p"${mysql_root_password}" >/dev/null 2>&1
        mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$user'@'localhost';" -u root -p"${mysql_root_password}" >/dev/null 2>&1
    else
        echo "User $user already exists"
    fi
done