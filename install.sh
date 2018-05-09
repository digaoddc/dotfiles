#!/bin/bash

command_exists () {
  type "$1" &> /dev/null ;
}

echo "Copying configuration files"
cp -rT configuration ~


echo "Install default packages"
if ! command_exists htop ; then
  sudo apt-get update
  sudo apt-get install -y ack htop build-essential zlib1g-dev liblzma-dev libxml2 libxml2-dev tmux curl wget emacs vim
fi

echo "Installing zsh"
if ! command_exists zsh ; then
  sudo apt-get install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  chsh -s /bin/zsh
fi

echo "Installing fzf"
if [ ! -d ~/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

echo "Installing Spacemacs"
if [ ! -d ~/.emacs.d ]; then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

echo "Installing Vundle"
if [ ! -d ~/.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Installing Docker"
# https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get install docker.io docker-compose

# Install emacs daemon as systemd unit
#cp -r ~/devel/dotfiles/.config ~/
#systemctl enable emacs-daemon --user
#sudo cp emacs.desktop /usr/share/applications

# Install asdf
# https://github.com/asdf-vm/asdf

# Install rbenv
# https://github.com/rbenv/rbenv

echo "Installing thefuck"
# https://github.com/nvbn/thefuck
if ! command_exists fuck ; then
  sudo apt install python3-dev python3-pip
  sudo pip3 install thefuck
fi


echo "Installing Albert"
# https://albertlauncher.github.io/docs/installing/
# https://www.ubuntuupdates.org/package/webupd8/artful/main/base/albert
mkdir -p ~/.config/albert/
cp albert/albert.conf ~/.config/albert/albert.conf
cp albert/websearch.json ~/.config/albert/org.albert.extension.websearch.json
