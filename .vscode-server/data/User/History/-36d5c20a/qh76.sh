#!/bin/bash

# Vérifier si le fichier de configuration existe
if [ ! -f "mysql_vars.yml" ]; then
    echo "Fichier de configuration 'mysql_vars.yml' introuvable."
    exit 1
fi

# Loop through the configurations and execute ansible playbook
while IFS= read -r line; do
    echo "Traitement de la configuration: $line"
    ansible-playbook -i localhost, -e "$line" sql_setup.yml
done < mysql_config.yml