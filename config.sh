#!/bin/bash

OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
INFO="$(tput setaf 4)[INFO]$(tput sgr0)"
WARN="$(tput setaf 5)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
ORANGE=$(tput setaf 166)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

local scrDir=$(dirname "$(realpath "$0")")

local configDir=()
configDir+=("i3")
configDir+=("polybar")
configDir+=("rofi")
configDir+=("picom")
# configDir+=("polybar")

local BAK=".bak"
for element in "${configDir[@]}"; do
  if [ ! -d "~/.config/$element" ]; then
    mkdir -p "~/.config/$element"
  else
    mv "~/.config/$element"
  fi
  cp -r "$scrDir"/"$element"/* ~/.config/"${element}${BAK}"
done




