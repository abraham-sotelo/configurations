#!/bin/bash

#sudo apt update

#setup zsh
if command -v zsh >/dev/null 2>&1; then
  echo "zsh is already installed"
else
  echo "Installing zsh"
  apt install -y zsh
fi
cp ./zsh/.zshrc ~/.zshrc

if [ -d ~/powerlevel10k ]; then
  echo "Skipping powerlevel10k clone"
else
  echo "Cloning powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi
cp ./zsh/.p10k.zsh ~/.p10k.zsh

if [ "$SHELL" = "$(which zsh)" ]; then
  echo "zsh is already the default shell"
else
  echo "making zsh the default shell"
  chsh -s $(which zsh)
fi

$(which zsh) -c "source ~/.zshrc"
