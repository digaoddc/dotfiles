#!/bin/bash
set -e -o pipefail

command_exists () {
  type "$1" &> /dev/null ;
}

mkdir -p ~/devel

git clone https://github.com/digaoddc/dotfiles.git ~/devel

echo "Copying configuration files"
cp -rT configuration ~

echo "Copy visual studio code settings"
cp code/* ~/.config/Code\ -\ OSS/User

if ! command_exists yay; then
  echo "Install yay"
  sudo pacman -Sy
  sudo pacman -Fy # sync packages
  sudo pacman -S yay
fi

if ! command_exists code; then
  echo "Install VSCode"
  yay -S code
fi

if ! command_exists ack; then
  echo "Install default packages"
  yay -S google-chrome ack vim tmux curl wget
fi

if ! command_exists zsh ; then
  echo "Installing zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  chsh -s /bin/zsh
fi

if [ ! -d ~/.fzf ]; then
  echo "Installing fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi


if [ ! -d ~/.vim ]; then
  echo "Installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


if ! command_exists docker; then
    echo "Installing Docker"
    sudo yay -S docker docker-compose
fi

# Install rbenv
# https://github.com/rbenv/rbenv
if ! command_exists rbenv ; then
 echo "Installing rbenv"
  yay -S rbenv
fi

if ! command_exists fuck ; then
  echo "Installing thefuck"
  # https://github.com/nvbn/thefuck
  sudo yay -S thefuck
fi


if ! command_exists openfortivpn ; then
  # https://albertlauncher.github.io/installing/
  echo "Installing Albert"
  mkdir -p ~/.config/albert/
  yay -S albert
  cp albert/albert.conf ~/.config/albert/albert.conf
fi

if ! command_exists openfortivpn ; then
  echo "Installing openforti VPN"
  yay -S openfortivpn
fi

# Install zoom
# https://zoom.us/download?os=linux

if ! command_exists flatpak ; then
  echo "Install flatpak"
  yay -S flatpak libpamac-flatpak-plugin
fi

flatpak install flathub org.telegram.desktop

if ! command_exists spotify; then
  echo "Install spotify"
  flatpak install spotify
fi

if ! command_exists session-manager-plugin; then
  echo "Install AWS session manager plugin"
  yay -S aws-session-manager-plugin
fi
