#!/usr/bin/env bash
# case "${1}" in
#     d|--drun) r_mode="drun" ;; 
#     w|--window) r_mode="window" ;;
#     f|--filebrowser) r_mode="filebrowser" ;;
#     h|--help) echo -e "$(basename "${0}") [action]"
#         echo "d :  drun mode"
#         echo "w :  window mode"
#         echo "f :  filebrowser mode,"
#         exit 0 ;;
#     *) r_mode="drun" ;;
# esac
# rofi -no-config -no-lazy-grab -show drun -modi drun -theme ~/.config/rofi/theme0/rofi/launcher.rasi
rofi -show drun -modi drun -config ~/.config/rofi/theme0/rofi/config.rasi
