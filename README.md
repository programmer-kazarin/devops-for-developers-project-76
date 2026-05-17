### Hexlet tests and linter status:
[![Actions Status](https://github.com/programmer-kazarin/devops-for-developers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/programmer-kazarin/devops-for-developers-project-76/actions)


# DevOps Project — Ansible Infrastructure

## Серверы

| Alias    | IP              | Роль            |
|----------|-----------------|-----------------|
| server1  | 192.168.1.106   | Web server      |
| server2  | 192.168.0.184   | Web server      |
| balancer | 192.168.1.107   | Load balancer   |
| postgres | 192.168.1.103   | Database        |

## Подготовка

### 1. Установить зависимости Python
pip install ansible

### 2. Настроить SSH-ключи
ssh-copy-id student@192.168.1.106
ssh-copy-id student@192.168.1.107
ssh-copy-id student@192.168.1.102
ssh-copy-id student@192.168.1.103

### 3. Дать права выполнять пользователю 'student' sudo без пароля на всех виртуалках:
``` bash
> make ssh_server1   # → sudo visudo → student ALL=(ALL) NOPASSWD:ALL
> make ssh_server2   # → sudo visudo → student ALL=(ALL) NOPASSWD:ALL
> make ssh_balanser  # → sudo visudo → student ALL=(ALL) NOPASSWD:ALL
> make ssh_postgres  # → sudo visudo → student ALL=(ALL) NOPASSWD:ALL
```

### 4. Установить роли Ansible Galaxy
make install

### 5. Подготовить все серверы (pip + docker)
make prepare

### 6. Задеплоить Caddy (балансировщик)
make deploy_caddy

### 7. Задеплоить PostgreSQL
make deploy_postgres

## Переменные

Все переменные описаны в директории `group_vars/`:
- `group_vars/all.yml` — общие переменные для всех хостов
- `group_vars/webservers.yml` — переменные для веб-серверов
- `group_vars/postgres/vault.yml` — секреты БД (зашифровано ansible-vault)

## Создание vault с паролем БД
ansible-vault create group_vars/postgres/vault.yml
# Содержимое:
# postgres_password: "Пароль"
