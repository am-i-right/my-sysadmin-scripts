#!/bin/bash


USERNAME="$1"
USER_DIR="/home/$USERNAME"
LOG_FILE="/var/log/user_setup.log"

# Проверка: аргумент обязателен
if [[ -z "$USERNAME" ]]; then
    echo "Ошибка: укажите имя пользователя."
    echo "Использование: $0 <username>"
    exit 1
fi

mkdir -p "$USER_DIR"
touch "$USER_DIR/.bashrc"

echo "Hello, $USERNAME! Directory $USER_DIR is ready."
echo "$(date): created $USER_DIR" >> "$LOG_FILE"

