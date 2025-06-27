### Hexlet tests and linter status:
[![Actions Status](https://github.com/AllegroGH/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AllegroGH/devops-for-programmers-project-77/actions)

### Upmon status
![Upmon](https://app.upmon.com/badge/e32914d5-bda3-474b-bca9-fe6c8c/YhUDlnND-2.svg)

### :small_blue_diamond: Краткое описание
Автоматизированное создание архитектуры ресурсов Yandex Cloud с помощью Terraform. Автоматизированное развертывание Docker-контейнера Redmine на кластере виртуальных машин в Yandex Cloud с использованием Ansible. Для мониторинга состояния серверов с приложением используется агент DataDog.

**Ключевые компоненты:**
- 2 виртуальные машины Compute Cloud (Ubuntu 22.04 LTS)
- Балансировщик Application Load Balancer
- Кластер Managed Service for PostgreSQL

### :small_blue_diamond: Подготовка
#### 1. Клонирование репозитория
```bash
git clone git@github.com:AllegroGH/devops-for-programmers-project-77.git
cd devops-for-programmers-project-77
```
#### 2. Подготовка Yandex Cloud
- Зарегистрируйтесь в Yandex Cloud
- Получите OAuth-токен, создайте рабочий каталог и сервисный аккаунт  в облаке
- Скопируйте шаблон `terraform/template.secret.auto.tfvars`:
   ```bash
   cp terraform/template.secret.auto.tfvars terraform/secret.auto.tfvars
   ```
- Добавьте полученные из облака данные в `terraform/secret.auto.tfvars` в переменные `yc_*`
- Создайте в облаке Backend Storage для хранения состояния инфраструктуры
- Скопируйте шаблон `terraform/template.secret.backend.tfvars`:
   ```bash
   cp terraform/template.secret.backend.tfvars terraform/secret.backend.tfvars
   ```
- Добавьте полученные из облака данные в `terraform/secret.backend.tfvars`
### :small_blue_diamond: Установка и настройка
#### 1. [:link:  Установка Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli )

#### 2. Установка зависимостей для Ansible
```bash
sudo apt update

# Основные пакеты
sudo apt install -y ansible python3-pip

# Python-зависимости
pip3 install docker ansible-vault

# Ansible-зависимости
make a-install-deps
```
#### 3. Настройка конфигурации
- Добавьте недостающие приватные данные в `terraform/secret.auto.tfvars`
### :small_blue_diamond: Создание инфраструктуры (Terraform)
- Выполните инициализацию рабочей дирректории с конфигурационными файлами:
  ```bash
  make t-init
  ```
- Создайте инфраструктуру:
  ```bash
  make t-apply
  ```
### :small_blue_diamond: Деплой (Ansible)
- Одной общей командой:
```bash
make a-deploy
```
- Отдельными командами:
```bash
# Установка зависимостей на ВМ
make a-prepare

# Развертывание Docker-контейнера Redmine на ВМ
make a-redmine

# Установка агента DataDog и настройка HTTP Check на ВМ
make a-datadog
```
### :small_blue_diamond: Безопасность данных
- Создайте файл с паролем (для временного использования):
  ```bash
  echo "your_vault_password" >> .vault-password
  ```
- Для дешифрования файлов с чувствительными данными используйте команду:
  ```bash
  make decrypt
  ```
- Для шифрования файлов с чувствительными данными используйте команду:
  ```bash
  make encrypt
  ```
- После настройки, создания архитектуры и деплоя рекомендуется выполнить шифрование данных, запомнить или записать пароль в надежном месте и удалить временный файл с паролем

#### :link: [Ссылка](https://devops3.allegrohub.ru) на задеплоенное приложение