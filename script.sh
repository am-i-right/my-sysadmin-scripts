#!/bin/bash

USERNAME="$1"
USER_DIR="/home/$USERNAME"

mkdir -p "$USER_DIR"
touch "$USER_DIR/.bashrc"
echo "Hello, $USERNAME! Directory created."
echo "$(date): created $USER_DIR" >> /var/log/setup.log
