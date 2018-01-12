#!/bin/bash

echo "Starting installation"
apt-get install -y git ack htop albert build-essential ruby-dev zlib1g-dev liblzma-dev redis-server libxml2 libxml2-dev tmux docker mysql-client mysql-server

# Install fzf
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install

# Install thefuck
# https://github.com/nvbn/thefuck
