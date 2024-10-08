#!/bin/bash

pushd "$(dirname "$0")"
#sudo apt update

#setup zsh
if command -v zsh >/dev/null 2>&1; then
  echo "zsh is already installed"
else
  echo "Installing zsh"
  apt install -y zsh
fi
echo "Creating symlinks for zsh"
if [ -L ~/.zshrc ]; then
  echo "Symlink for .zshrc already exists"
else
  ln -s "$(pwd)/.zshrc" ~/.zshrc
fi

if [ -d ~/powerlevel10k ]; then
  echo "Skipping powerlevel10k clone"
else
  echo "Cloning powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi
echo "Creating symlinks for powerlevel10k"
if [ -L ~/.p10k.zsh ]; then
  echo "Symlink for .p10k.zsh already exists"
else
  ln -s "$(pwd)/.p10k.zsh" ~/.p10k.zsh
fi

popd

if [ "$SHELL" = "$(which zsh)" ]; then
  echo "zsh is already the default shell"
else
  echo "making zsh the default shell"
  chsh -s $(which zsh)
fi
exec zsh
source ~/.zshrc
