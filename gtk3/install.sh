#!/bin/bash 

local_dir=$(dirname $(realpath $0))
function install_gtk3(){
  wget https://github.com/dracula/gtk/archive/master.zip
  unzip gtk-master.zip 
  sudo cp -r gtk-master /usr/share/themes/Dracula
  mkdir $HOME/.themes
  sudo cp -r gtk-master $HOME/.themes/Dracula 
  if [ ! -d $HOME/.config/gtk-3.0 ];then
    mkdir $HOME/.config/gtk-3.0
  fi
  cp $local_dir/settings.ini $HOME/.config/gtk-3.0
  cp $local_dir/libadwaita-tc.py $HOME/.themes/Dracula
  cd $HOME/.themes/Dracula
  ./libadwaita-tc.py
}
