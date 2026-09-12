#!/bin/bash

USERNAME="$1"
USER_DIR="/home/$USERNAME"
LOG_FILE="/var/log/user_setup.log"

if [[ -z "$USERNAME" ]]; then
    echo "Ошибка: укажите имя пользователя." >&2
    echo "Использование: $0 <username>" >&2
    exit 1
fi

mkdir -p "$USER_DIR"
touch "$USER_DIR/.bashrc"

if [[ ! -f "$LOG_FILE" ]]; then
    sudo touch "$LOG_FILE"
    sudo chmod 666 "$LOG_FILE"
fi

echo "Hello, $USERNAME! Directory $USER_DIR is ready."
echo "$(date '+%Y-%m-%d %H:%M:%S') created $USER_DIR" >> "$LOG_FILE"
