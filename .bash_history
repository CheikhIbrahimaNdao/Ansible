code .
ansible-playbook Numbers.yml 
cd DB_Provisionning/
ansible-playbook Github.yml --ask-vault-pass
cd
ansible-playbook Github.yml --ask-vault-pass
cd DB_Provisionning/
cd
ansible-playbook Numbers.yml 
ansible-playbook Numbers.yml --extra-vars '{"db_name_db": ["database1", "database2", "database3"]}'
ansible-playbook Numbers.yml 
cd DB_Provisionning/
ansible-playbook Numbers.yml 
ansible-playbook Github.yml --ask-vault-pass
cd
ansible-playbook Numbers.yml 
cd DB_Provisionning/
ansible-playbook Github.yml --ask-vault-pass
exit
cd DB_Provisionning/
code .
ansible-playbook Github.yml --ask-vault-pass
cd
code .
ansible-playbook Github.yml --ask-vault-pass
ansible-playbook Numbers.yml 
ansible-playbook Numbers.yml -e "dba_env_db=sp"
ansible-playbook Github.yml --ask-vault-pass
ansible-playbook Numbers.yml -e "dba_env_db=sp"
ansible-playbook Numbers.yml -e "dba_env_db=ppd"
cd DB_Provisionning/
ansible-playbook Github.yml --ask-vault-pass
cd
ansible-playbook Github.yml --ask-vault-pass
