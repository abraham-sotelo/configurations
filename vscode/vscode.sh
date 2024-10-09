#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"

# Check if I am running inside WSL
/mnt/c/Windows/System32/wsl.exe -l -v
if [ $? -eq 0 ]; then
  echo "Running inside WSL"
  TARGET_DIR=/mnt/c/Users/PC-Admin/AppData/Roaming/Code/User
else
  TARGET_DIR=~/.config/Code/User
fi

echo "Copying VSCode config files"
cp "$SCRIPT_DIR/settings.json" "$TARGET_DIR/settings.json"
cp "$SCRIPT_DIR/keybindings.json" "$TARGET_DIR/keybindings.json"