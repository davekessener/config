#!/bin/bash

sudo cp tmux-a /usr/local/bin/
sudo chmod a+x /usr/local/bin/tmux-a

mkdir -p ~/.ssh

cat < ssh.config >> ~/.ssh/config
cat < bashrc >> ~/.bashrc
cp vimrc ~/.vimrc

git config --global user.email "davekessener@gmail.com"
git config --global user.name "Dave Kessener"

