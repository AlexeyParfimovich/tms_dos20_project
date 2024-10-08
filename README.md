# tms_dos20_project
The final course project


## Задание
Цель: Настроить автоматическое развертывание и мониторинг веб-приложения на Linux VM с использованием Apache Web Server, автоматизируя этот процесс с помощью Ansible, интегрируя непрерывную интеграцию через GitLab CI и настраивая мониторинг через Zabbix.

## Общие требования:
Все компоненты должны быть автоматизированы для установки и конфигурации.
Использование GitLab CI для непрерывной интеграции и доставки приложения.
Настройка Zabbix для мониторинга производительности приложения и сервера.

## Шаг 1: Настройка Linux VM и инфраструктуры
### Использование Ansible:
Создать Ansible playbook, который автоматизирует установку и настройку Apache Web Server на Linux VM.
Автоматизировать установку и базовую настройку Zabbix агента на VM для мониторинга.

### Настройка GitLab CI:
Разработать .gitlab-ci.yml конфигурацию для автоматического тестирования, сборки и развертывания приложения.
Настройка автоматического развертывания на VM через Ansible после успешной сборки в GitLab CI.


## Шаг 2: Разработка и развертывание приложения
### Разработка веб-приложения:
Предложить разработку простого веб-приложения, например, на Python Flask или Node.js, которое отвечает базовым REST API запросам.
Контейнеризация приложения, если это необходимо, для упрощения развертывания и управления зависимостями.

### Развертывание приложения на Apache Web Server:
Настройка Apache для обслуживания приложения, включая конфигурацию виртуальных хостов и безопасных соединений.


## Шаг 3: Мониторинг и масштабирование
### Настройка мониторинга с Zabbix:
Конфигурация Zabbix для мониторинга серверных метрик (CPU, память, диск, сеть) и метрик приложения.
Настройка оповещений в Zabbix для реагирования на критические события и изменения в производительности сервера или приложения.

## План масштабирования:
Описать возможные сценарии масштабирования инфраструктуры при увеличении нагрузки, используя те же технологии и инструменты.
