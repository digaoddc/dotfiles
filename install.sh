#!/bin/bash

echo "Starting installation"
apt-get install -y git ack htop albert build-essential ruby-dev zlib1g-dev liblzma-dev redis-server libxml2 libxml2-dev tmux docker mysql-client mysql-server

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install docker
# https://docs.docker.com/install/linux/docker-ee/ubuntu

# Install asdf
# https://github.com/asdf-vm/asdf

# Install rbenv
# https://github.com/rbenv/rbenv

# Install thefuck
# https://github.com/nvbn/thefuck

# Install albert
# https://albertlauncher.github.io/docs/installing/
cp albert/albert.conf ~/.config/albert/albert.conf
cp albert/engines.json ~/.config/albert/org.albert.extension.websearch.json
