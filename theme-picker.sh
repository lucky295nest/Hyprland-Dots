#!/bin/bash
THEME_DIR="$HOME/dotfiles/themes"

PICK=$(ls -1 "$THEME_DIR" | rofi -dmenu -p "🎨 Theme")

[ -z "$PICK" ] && exit 0

"$HOME/dotfiles/theme-switcher.sh" "$PICK"
