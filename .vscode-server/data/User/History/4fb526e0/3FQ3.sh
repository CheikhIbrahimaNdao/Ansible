#!/bin/bash

# Chemin vers le playbook Ansible
PLAYBOOK_PATH="/home/ndao/mysql_setup/sql_setup.yml"

# Exécution du playbook Ansible avec le mot de passe root MySQL en tant qu'argument
ansible-playbook "$PLAYBOOK_PATH" --extra-vars="mysql_root_password=$1"
