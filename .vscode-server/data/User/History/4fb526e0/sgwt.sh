#!/bin/bash

# Demande du mot de passe root MySQL
read -sp "Mot de passe Root: " mysql_root_password
echo

# Fichier YAML contenant les variables
VARS_FILE="/home/ndao/mysql_setup/vars/mysql_vars.yml"

# Crée les bases de données et les utilisateurs
databases=$(yq eval '.databases' $VARS_FILE)

for i in $(echo $databases | yq eval '.[] | @base64' -); do
  _jq() {
    echo ${i} | base64 --decode | jq -r ${1}
  }

  db_name=$(_jq '.name')
  db_user=$(_jq '.user')
  db_password=$(_jq '.password')

# Exécution du playbook Ansible pour chaque base de données et utilisateur
ansible_playbook_path="/home/ndao/mysql_setup/sql_setup.yml"

# Loop through databases and create them
{% for item in databases %}
ansible-playbook $ansible_playbook_path --extra-vars "db_name={{ item.name }} db_user={{ item.user }} db_password={{ item.password }} mysql_root_password=$mysql_root_password"
{% endfor %}
