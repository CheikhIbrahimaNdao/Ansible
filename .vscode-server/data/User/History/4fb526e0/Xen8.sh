#!/bin/bash

# Chemin vers le playbook Ansible
PLAYBOOK_PATH="/home/ndao/mysql_setup/sql_setup.yml"

# Exécution du playbook Ansible
ansible-playbook "$PLAYBOOK_PATH" --ask-become-pass

# Loop through databases and create them
{% for item in databases %}
mysql -e "CREATE DATABASE IF NOT EXISTS {{ item.name }};" -u root -p"${mysql_root_password}" >/dev/null 2>&1
{% endfor %}

# Loop through users, check if exists and create if not
{% for item in databases %}
user_exists=$(mysql -sN -e "SELECT user FROM mysql.user WHERE user='{{ item.user }}';" -u root -p"${mysql_root_password}" 2>/dev/null)
if [ -z "$user_exists" ]; then
    mysql -e "CREATE USER IF NOT EXISTS '{{ item.user }}'@'localhost' IDENTIFIED BY '{{ item.password }}';" -u root -p"${mysql_root_password}" >/dev/null 2>&1
    mysql -e "GRANT ALL PRIVILEGES ON {{ item.name }}.* TO '{{ item.user }}'@'localhost';" -u root -p"${mysql_root_password}" >/dev/null 2>&1
else
    echo "User {{ item.user }} already exists"
fi
{% endfor %}
