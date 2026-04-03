#!/bin/bash
SCRIPT_DIR="$HOME/.config/lucky-scripts"
THEME_DIR="$HOME/.config/lucky-themes"

PICK=$(ls -1 "$THEME_DIR" | rofi -dmenu -p "🎨 Theme")

[ -z "$PICK" ] && exit 0

"$SCRIPT_DIR/theme-switcher.sh" "$PICK"
