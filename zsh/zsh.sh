#!/bin/bash
cd $(dirname $0)

if [ $(lsb_release -a 2>/dev/null | grep "^Distributor ID" | cut -f2) == 'Ubuntu' ];
then
  
  apt install zsh && \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k && \
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc && \
  cp .zshrc ~/.zshrc && \
  cp .p10k.zsh ~/.p10k.zsh

else
  echo "Other Linux distro"
  exit 1
fi
#lsb_release -a 2>/dev/null | grep "^Distributor ID" | cut -f2 
#
