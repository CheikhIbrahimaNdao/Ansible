#!/bin/bash

# Prompt for the root MySQL password
read -s -p "Mot de passe Root: " root_password
echo

# Initialize arrays for databases and users
declare -a databases
declare -a users
declare -a passwords

# Retrieve arguments from the command line
for ((i=1; i<=10; i++)); do
  eval "databases[i]=\${DB$i}"
  eval "users[i]=\${USER$i}"
done

# Check if there is one user per database or a single user for all databases
if [ ${#users[@]} -eq 1 ]; then
  single_user=true
  echo "Single user mode: All databases will use the same user."
elif [ ${#users[@]} -ne ${#databases[@]} ]; then
  echo "Error: The number of users does not match the number of databases."
  exit 1
else
  single_user=false
fi

# Define the playbook and vars file paths
PLAYBOOK="/home/ndao/mysql_setup/sql_setup.yml"
VARS_FILE="/home/ndao/mysql_setup/vars/mysql_vars.yml"

# Function to update vars file with new database and user
update_vars_file() {
  local db_name=$1
  local db_user=$2
  local db_password=$3

  cat <<EOF >> $VARS_FILE
db_name: "$db_name"
db_user: "$db_user"
db_password: "$db_password"

EOF
}

# Check if the user already exists and display the generated passwords
echo "Generated passwords for the users:"
for ((i=1; i<=10; i++)); do
  if [ -n "${databases[i]}" ]; then
    db_name="${databases[i]}"
    if $single_user; then
      db_user="${users[1]}"
    else
      db_user="${users[i]}"
    fi
    
    # Check if the user already exists
    user_exists=$(mysql -uroot -p$root_password -e "SELECT User FROM mysql.user WHERE User='${db_user}'" | grep -c "${db_user}")
    
    if [ $user_exists -eq 0 ]; then
      db_password=$(openssl rand -base64 12) # Generate a random password

      # Store the password in the passwords array
      passwords[i]=$db_password

      # Update vars file with current database and user
      update_vars_file "$db_name" "$db_user" "$db_password"

      # Run the Ansible playbook
      ansible-playbook $PLAYBOOK --extra-vars "mysql_root_password=$root_password"
      
      echo "User ${db_user}: ${passwords[i]}"
    else
      echo "User ${db_user} already exists. Skipping password generation."
    fi
  fi
done
