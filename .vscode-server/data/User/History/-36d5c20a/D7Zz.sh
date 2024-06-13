#!/bin/bash

# Set MySQL root password
mysql_root_password="{{ mysql_root_password }}"

# Loop through databases and create them
{% for item in databases %}
mysql -e "CREATE DATABASE IF NOT EXISTS {{ item.name }};" -u root -p"{{ mysql_root_password }}"
{% endfor %}

# Loop through users, check if exists and create if not
{% for item in databases %}
user_exists=$(mysql -sN -e "SELECT user FROM mysql.user WHERE user='{{ item.user }}';" -u root -p"{{ mysql_root_password }}")
if [ -z "$user_exists" ]; then
    mysql -e "CREATE USER '{{ item.user }}'@'localhost' IDENTIFIED BY '{{ item.password }}';" -u root -p"{{ mysql_root_password }}"
    mysql -e "GRANT ALL PRIVILEGES ON {{ item.name }}.* TO '{{ item.user }}'@'localhost';" -u root -p"{{ mysql_root_password }}"
else
    echo "User {{ item.user }} already exists"
fi
{% endfor %}
