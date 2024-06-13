#!/bin/bash

# Path to your Ansible playbook
PLAYBOOK_PATH="/home/ndao/mysql_setup/sql_setup.yml"

# Prompt for the MySQL root password
read -sp 'Mot de passe Root: ' MYSQL_ROOT_PASSWORD

# Number of iterations
ITERATIONS=3

for ((i = 1; i <= ITERATIONS; i++)); do
  echo "Execution $i/$ITERATIONS"
  ansible-playbook $PLAYBOOK_PATH --extra-vars "mysql_root_password=$MYSQL_ROOT_PASSWORD"
done

echo "Terminé."