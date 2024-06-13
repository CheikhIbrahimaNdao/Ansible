#!/bin/bash

# Chemin vers le playbook Ansible
PLAYBOOK_PATH="/home/ndao/mysql_setup/sql_setup.yml"

# Exécution du playbook Ansible
ansible-playbook "$PLAYBOOK_PATH" --ask-become-pass
