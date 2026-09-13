#!/bin/bash

set -euo pipefail

readonly BASE_DIR="${HOME}/managed_users"
readonly LOG_FILE="${BASE_DIR}/user_setup.log"

USERNAME="${1:-}"

if [[ -z "$USERNAME" ]]; then
    echo "Ошибка: укажите имя пользователя." >&2
    echo "Использование: $0 <username>" >&2
    exit 1
fi

readonly USER_DIR="${BASE_DIR}/${USERNAME}"

mkdir -p "${BASE_DIR}"
mkdir -p "${USER_DIR}"
touch "${USER_DIR}/.bashrc"

echo "Hello, ${USERNAME}! Directory ${USER_DIR} is ready."
echo "$(date '+%Y-%m-%d %H:%M:%S') created ${USER_DIR}" >> "${LOG_FILE}"
