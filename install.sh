#!/bin/bash
set -e -o pipefail

command_exists () {
  type "$1" &> /dev/null ;
}

echo "Copying configuration files"
cp -rT configuration ~


if ! command_exists yay; then
  echo "Install yay"
  sudo pacman -Sy
  sudo pacman -Fy # sync packages
  sudo pacman -S yay
fi

if ! command_exists emacs; then
  echo "Install default packages"
  yay -S google-chrome ack vim tmux curl wget emacs
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

if [ ! -d ~/.emacs.d ]; then
  echo "Installing Spacemacs"
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

if [ ! -d ~/.vim ]; then
  echo "Installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


if ! command_exists docker; then
    echo "Installing Docker"
    sudo pacman -S docker docker-compose
fi


# Install emacs daemon as systemd unit
#cp -r ~/devel/dotfiles/.config ~/
#systemctl enable emacs-daemon --user
#sudo cp emacs.desktop /usr/share/applications

# Install asdf
# https://github.com/asdf-vm/asdf

# Install rbenv
# https://github.com/rbenv/rbenv
if ! command_exists rbenv ; then
 echo "Installing rbenv"
  yay -S rbenv
fi

if ! command_exists fuck ; then
  echo "Installing thefuck"
  # https://github.com/nvbn/thefuck
  sudo pacman -S thefuck
fi


# echo "Installing Albert"
# https://albertlauncher.github.io/installing/
#mkdir -p ~/.config/albert/
#cp albert/albert.conf ~/.config/albert/albert.conf
#cp albert/websearch.json ~/.config/albert/org.albert.extension.websearch.json

if ! command_exists openfortivpn ; then
  echo "Installing openforti VPN"
  yay -S openfortivpn
fi

# Install zoom
# https://zoom.us/download?os=linux

if ! command_exists openfortivpn ; then
  echo "Install flatplak"
  pamac install flatpak libpamac-flatpak-plugin
fi

# if ! command_exists spotify; then
#   echo "Install spotify"
#   flatpak install spotify
# fi
