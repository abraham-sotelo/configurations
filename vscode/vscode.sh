#!/bin/bash

# Check if I am running inside WSL
/mnt/c/Windows/System32/wsl.exe -l -v
if [ $? -eq 0 ]; then
  target=/mnt/c/Users/PC-Admin/AppData/Roaming/Code/User
else
  target=~/.config/Code/User
fi

cp ./vscode/settings.json $target/settings.json
cp ./vscode/keybindings.json $target/keybindings.json