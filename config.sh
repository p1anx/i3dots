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

scrDir=$(dirname "$(realpath "$0")")
echo "scrdir = ${scrDir}"

configDir=()
configDir+=("i3")
configDir+=("polybar")
configDir+=("rofi")
configDir+=("picom")
# configDir+=("polybar")

BAK=".bak"
BAK_DIR="$HOME/.config/config-bak"
for element in "${configDir[@]}"; do
  if [ ! -d "~/.config/$element" ]; then
    mkdir -p "~/.config/$element"
  else
      if [ ! -d "$BAK_DIR" ]; then
          mkdir "$BAK_DIR"
      fi
      mv "$HOME/.config/$element" "$BAK_DIR/${element}${BAK}"
      echo "$OK $element backup ok"
  fi
  cp -r "$scrDir/$element" "$HOME/.config/${element}"
  echo "$OK $element copy up"
done


