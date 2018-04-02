#!/bin/bash

# Install emacs daemon as systemd unit
cp -r ~/devel/dotfiles/.config ~/
systemctl enable emacs-daemon --user
sudo cp emacs.desktop /usr/share/applications

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Copying configuration files"
cp -rT configuration ~

echo "Starting installation"
# apt-get install -y git ack htop build-essential zlib1g-dev liblzma-dev redis-server libxml2 libxml2-dev tmux docker mysql-client mysql-server

# Install docker
# https://docs.docker.com/install/linux/docker-ce/ubuntu/

# Install asdf
# https://github.com/asdf-vm/asdf

# Install rbenv
# https://github.com/rbenv/rbenv

# Install thefuck
# https://github.com/nvbn/thefuck

# Install albert
# https://albertlauncher.github.io/docs/installing/

mkdir -p ~/.config/albert/
cp albert/albert.conf ~/.config/albert/albert.conf
cp albert/engines.json ~/.config/albert/org.albert.extension.websearch.json
