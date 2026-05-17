ssh_server1:
	ssh student@192.168.1.106

ssh_server2:
	ssh student@192.168.1.107

ssh_balanser:
	ssh student@192.168.1.102

ssh_postgres:
	ssh student@192.168.1.103

# Установка ролей из Ansible Galaxy
install:
	ansible-galaxy install -r requirements.yml

# Подготовка серверов (pip + docker)
prepare:
	ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass

# Установка Caddy
deploy_caddy:
	ansible-playbook -i inventory.ini install_caddy.yml 

# Установка PostgreSQL
deploy_postgres:
	ansible-playbook -i inventory.ini install_postgres.yml --ask-vault-pass
