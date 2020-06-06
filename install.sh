#!/bin/bash

sudo cp tmux-a /usr/local/bin/
sudo chmod a+x /usr/local/bin/tmux-a

mkdir -p ~/.ssh

cat < ssh.config >> ~/.ssh/config
cat < bashrc >> ~/.bashrc
cat < vimrc >> ~/.vimrc
