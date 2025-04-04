#!/bin/bash
SCRIPT_DIR=$(dirname $(realpath $0))
source SCRIPT_DIR/picom/install.sh
source SCRIPT_DIR/i3/install.sh

function install_fcitx5(){
  sudo apt install fcitx5 -y
  sudo apt install fcitx5-chinese-addons -y
  sudo apt install fcitx5-frontend-gtk3 fcitx5-frontend-gtk2 -y
  sudo apt install fcitx5-frontend-qt5 kde-config-fcitx5 -y
  if [ -f "$HOME/.zshrc" ]; then
    tee -a $HOME/.zshrc << EOF
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
EOF
  elif [ -f "$HOME/.bashrc" ]; then
    tee -a $HOME/.bashrc << EOF
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
EOF
  else
    echo 'fcitx5 needs to write"export GTK_IM_MODULE=fcitx5;export QT_IM_MODULE=fcitx5;export XMODIFIERS=@im=fcitx5" in .zshrc or .bashrc'
    exit 1
  fi
}
function nerd_font(){

}
function install_bluetooth(){
  sudo apt install -y bluez blueman
}

function install_autotiling(){
  sudo apt install python3-pip -y
  pip3 install autotiling
}

function main(){
  sudo apt update -y
  install_i3
  install_autotiling
  install_picom
  sudo apt install rofi -y
  sudo apt install polybar -y

}
main
