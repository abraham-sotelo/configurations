#!/bin/bash
cd $(dirname $0)

#Mount drives on root
cp ./wsl.conf /etc/wsl.conf 

#Use Windows' Git binary
PATH=$PATH:/c/Program Files/Git/bin
mv /usr/bin/git /usr/bin/gitl
echo "alias git=git.exe" >> ~/.bashrc
