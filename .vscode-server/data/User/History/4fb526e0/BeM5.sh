#!/bin/bash

# Demande du mot de passe root MySQL
read -sp "Mot de passe Root: " mysql_root_password
echo

# Exécution du playbook Ansible pour chaque base de données et utilisateur
ansible_playbook_path="/home/ndao/mysql_setup/sql_setup.yml"

# Loop through databases and create them
{% for item in databases %}
ansible-playbook $ansible_playbook_path --extra-vars "db_name={{ item.name }} db_user={{ item.user }} db_password={{ item.password }} mysql_root_password=$mysql_root_password" --ask-become-pass
{% endfor %}
