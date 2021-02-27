#!/bin/bash
cd $(dirname $0)

#Mount drives on root
cp ./wsl.conf /etc/wsl.conf 

#Install zsh
sh -c ../zsh/zsh.sh 
echo $pwd

#Use Windows' Git binary
#mv /usr/bin/git /usr/bin/gitl
#echo "alias git=git.exe" >> ~/.bashrc
