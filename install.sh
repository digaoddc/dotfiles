#!/bin/bash
set -e -o pipefail

command_exists () {
  type "$1" &> /dev/null ;
}

echo "Copying configuration files"
cp -rT configuration ~


echo "Install yay"
if ! command_exists yay; then
  sudo pacman -Sy
  sudo pacman -Fy # sync packages
  sudo pacman -S yay
fi

echo "Install default packages"
if ! command_exists emacs; then
  # sudo apt-get install -y ack htop build-essential zlib1g-dev liblzma-dev libxml2 libxml2-dev tmux curl wget emacs vim
  yay -S google-chrome ack vim tmux curl wget emacs
fi

echo "Installing zsh"
if ! command_exists zsh ; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
sudo pacman -S docker docker-compose

# Install emacs daemon as systemd unit
#cp -r ~/devel/dotfiles/.config ~/
#systemctl enable emacs-daemon --user
#sudo cp emacs.desktop /usr/share/applications

# Install asdf
# https://github.com/asdf-vm/asdf

# Install rbenv
# https://github.com/rbenv/rbenv
if ! command_exists rbenv ; then
  yay -S rbenv
fi

echo "Installing thefuck"
# https://github.com/nvbn/thefuck
if ! command_exists fuck ; then
  sudo pacman -S thefuck
fi


echo "Installing Albert"
# https://albertlauncher.github.io/installing/
#mkdir -p ~/.config/albert/
#cp albert/albert.conf ~/.config/albert/albert.conf
#cp albert/websearch.json ~/.config/albert/org.albert.extension.websearch.json

echo "Installing openforti VPN"
# https://github.com/nvbn/thefuck
if ! command_exists openfortivpn ; then
  yay -S openfortivpn
fi
