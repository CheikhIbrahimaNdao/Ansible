history
ls
ansible-playbook GenPass.yml
ansible-galaxy collection install community.general
ansible-playbook GenPass.yml
ls
ansible-playbook GenPass.yml
exit
sudo mysql -u root
sudo service mysql restart
sudo mysql -u root
ansible-playbook mysql_setup/Clonedb.yml --ask-become-pass
ansible-playbook Github.yml --ask-vault-pass
git push -f
ansible-vault credentials.yaml
ansible-vault encrypt credentials.yaml
ansible-playbook Github.yml --ask-vault-pass
git push -f
ansible-vault encrypt_string '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' --name 'password' >> credentials.yaml
ansible-playbook Github.yml --ask-vault-pass
ansible-vault encrypt_string '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' --name 'password' > credentials.yaml
git push -f
ansible-playbook Github.yml --ask-vault-pass
sudo mysql -u root 
ansible-playbook mysql_setup/Clonedb.yml --ask-become-pass
sudo mysql -u root 
sudo service mysql restart
sudo mysql -u root 
ansible-playbook mysql_setup/provisioning.yml --ask-become-pass
ansible-playbook mysql_setup/user_test.yml --ask-become-pass
ansible-playbook mysql_setup/test_user.yml --ask-become-pass
sudo mysql -u root 
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
sudo mysql -u root 
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
sudo mysql -u root 
ansible-playbook mysql_setup/mysql_setup.yml --ask-become-pass
sudo mysql -u root 
ansible-playbook mysql_setup/mysql_setup.yml --ask-become-pass
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
chmod +x mysql_setup/shell_script.sh
./mysql_setup/shell_script.sh
ansible-playbook mysql_setup/provisioning.yml --ask-become-pass
sudo mysql -u root 
ansible-playbook mysql_setup/provisioning.yml --ask-become-pass
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
sudo mysql -u root 
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
./mysql_setup/shell_script.sh
clear
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
./mysql_setup/shell_script.sh
ansible-playbook mysql_setup/sql_shell.yml --ask-become-pass
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
sudo service mysql restart
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
sudo mysql -u root 
ansible-playbook mysql_setup/sql_setup.yml --ask-become-pass
ansible-playbook mysql_setup/sql_shell.yml --ask-become-pass
./mysql_setup/templates/shell_script.sh
clear
ansible-playbook mysql_setusql_shell.yml --ask-become-pass
ansible-playbook mysql_setup/sql_shell.yml --ask-become-pass
ls -l /home/ndao/mysql_setup/templates/shell_script.sh.j2
ls
cd mysql_setup/
ls
cd templates/
ls
cd ..
ls -l /home/ndao/mysql_setup/templates/shell_script.sh
chmod 755 /home/ndao/mysql_setup
chmod 755 /home/ndao/mysql_setup/templates
ls -l /home/ndao/mysql_setup
ansible-playbook mysql_setup/sql_shell.yml --ask-become-pass
./home/ndao/mysql_setup/templates/shell_script.sh
ls -l ./home/ndao/mysql_setup/templates/shell_script.sh
ls -l /home/ndao/mysql_setup/templates/shell_script.sh
chmod +x /home/ndao/mysql_setup/templates/shell_script.sh
chmod +x shell_script.sh
./home/ndao/mysql_setup/templates/shell_script.sh
./shell_script.sh
cd /home/ndao/mysql_setup/templates/shell_script.sh
cd mysql_setup/templates/shell_script.sh
cd mysql_setup/templates/
./shell_script.sh
cd ./
cd /
cd ~
./home/ndao/mysql_setup/templates/shell_script.sh
cd mysql_setup/templates/
./shell_script.sh
sudo ./shell_script.sh
clear
sudo ./shell_script.sh
ansible-playbook mysql_setup/sql_setup.yml --extra-vars "db_name={{ item.name }} db_user={{ item.user }} db_password={{ item.password }} mysql_root_password=$mysql_root_password" --ask-become-pass
cd ~
ansible-playbook mysql_setup/sql_setup.yml --extra-vars "db_name={{ item.name }} db_user={{ item.user }} db_password={{ item.password }} mysql_root_password=$mysql_root_password" --ask-become-pass
sudo ./shell_script.sh
sudo ./home/ndao/mysql_setup/templates/shell_script.sh
cd mysql_setup/templates/shell_script.sh
cd /home/ndao/mysql_setup/templates/
sudo ./shell_script.sh
cd ~
clear
