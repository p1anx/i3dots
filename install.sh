#!/bin/bash
SCRIPT_DIR=$(dirname $(realpath $0))
source $SCRIPT_DIR/picom/install.sh
source $SCRIPT_DIR/i3/install.sh
source $SCRIPT_DIR/betterlockscreen/install.sh
source $SCRIPT_DIR/config.sh
source $SCRIPT_DIR/gtk3/install.sh
source $SCRIPT_DIR/fcitx5/install.sh

function install_bluetooth(){
  sudo apt install -y bluez blueman
}

function install_autotiling(){
  sudo apt install python3-pip -y
  pip3 install autotiling
}

function install_fish(){
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt update -y
  sudo apt install fish -y
}
function install_nerdfont(){
  #install nerd fonts
  mkdir -p ~/.local/share/fonts

  cd ~/.local/share/fonts && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
  tar -xJvf JetBrainsMono.tar.xz

  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.tar.xz
  tar -xJvf Mononoki.tar.xz

  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz
  tar -xJvf FiraCode.tar.xz

}
function install_essential(){
  sudo apt install curl -y
  sudo apt install rofi -y
  sudo apt install polybar -y
  sudo apt install feh -y
  sudo apt install kitty -y

}
function main(){
  sudo apt update -y
  install_fish
  install_essential
  install_i3
  install_autotiling
  install_picom
  install_nerdfont
  install_fcitx5
  install_gtk3
  install_betterlockscreen
  config_i3
  betterlockscreen -u $HOME/.config/i3/wallpaper/Bonsai-big.jpg

}
main
