#!/usr/bin/env bash

sudo apt upgrade && sudo apt install vim

# https://github.com/raspberrypi/firmware/issues/1224#issuecomment-1470791044
sudo vim /boot/config.txt

ssh-keygen -t rsa -b 4096 -C "jknightdev@gmail.com"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

mkdir ~/src
cd ~/src
git clone https://github.com/jameswilliamknight/scripts.pub.git
