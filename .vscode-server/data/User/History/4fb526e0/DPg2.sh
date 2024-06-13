#!/bin/bash

# Charger les variables depuis le fichier YAML
source /home/ndao/mysql_setup/vars/mysql_vars.yml

# Si chaque base de données a un seul utilisateur, on parcourt simplement les bases de données
for db_index in {1..10}; do
    # Construire le nom de la base de données et récupérer le mot de passe
    db_var="db${db_index}"
    db_name="${!db_var}"
    
    pass_var="pass${db_index}"
    db_password="${!pass_var}"

    # Exécuter le playbook Ansible
    ansible-playbook /home/ndao/mysql_setup/sql_setup.yml \
        -e "db_name=$db_name" \
        -e "db_password=$db_password"

    # Votre logique ici pour chaque base de données
    echo "Database setup for: $db_name"
    
    # Votre traitement ici
done
