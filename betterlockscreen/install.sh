#!/bin/bash 
function install_requirement(){
  #install i3lock-color
  sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev libgif-dev -y
  git clone https://github.com/Raymo111/i3lock-color.git $HOME/i3lock-color
  cd $HOME/i3lock-color 
  ./install-i3lock-color.sh

  #install imagemagick
  sudo apt install libpng-dev libjpeg-dev libtiff-dev -y
  sudo apt install imagemagick -y
  #install bc
  sudo apt install bc -y

}
function install_betterlockscreen(){
  install_requirement
  # wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user
  wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system

}
