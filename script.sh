#!/bin/bash
set -euo pipefail

readonly LOG_FILE="/var/log/user_setup.log"
USERNAME="${1:-}"

if [[ -z "$USERNAME" ]]; then
    echo "Ошибка: укажите имя пользователя." >&2
    echo "Использование: $0 <username>" >&2
    exit 1
fi

readonly USER_DIR="/home/${USERNAME}"

if [[ ! -w "/home" ]]; then
    echo "Ошибка: нет прав на запись в /home." >&2
    echo "Запустите скрипт через sudo: sudo $0 ${USERNAME}" >&2
    exit 1
fi

if ! mkdir -p "${USER_DIR}" 2>/dev/null; then
    echo "Ошибка: не удалось создать ${USER_DIR}" >&2
    exit 1
fi
touch "${USER_DIR}/.bashrc"

touch "${LOG_FILE}" 2>/dev/null || {
    echo "Ошибка: не удалось создать лог-файл ${LOG_FILE}" >&2
    exit 1
}

echo "Hello, ${USERNAME}! Directory ${USER_DIR} is ready."
echo "$(date '+%Y-%m-%d %H:%M:%S') created ${USER_DIR}" >> "${LOG_FILE}"
