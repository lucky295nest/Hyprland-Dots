#!/bin/bash

THEME_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.config"

if [ -z "$1" ]; then
  echo "Usage: ./theme-switcher.sh theme-name"
  echo "Available themes: $(ls -1 $THEME_DIR | xargs)"
  exit 1
fi

THEME_PATH="$THEME_DIR/$1"

if [ ! -d "$THEME_DIR/$1" ]; then
  echo "Error: Theme '$1' not found in $THEME_DIR"
  exit 1
fi

echo "switching to theme: $1"
notify-send "Theme switcher" "Theme switched to: $1"

# Kitty
ln -sf "$THEME_PATH/theme-kitty.conf" "$TARGET_DIR/kitty/theme.conf"

# Hyprland
ln -sf "$THEME_PATH/theme-hyprland.conf" "$TARGET_DIR/hypr/theme.conf"
hyprctl reload

# Waybar
ln -sf "$THEME_PATH/theme-waybar.css" "$TARGET_DIR/waybar/theme.css"
ln -sf "$THEME_PATH/theme-waybar.jsonc" "$TARGET_DIR/waybar/config.jsonc"
killall -SIGUSR2 waybar

# Mako
ln -sf "$THEME_PATH/theme-mako" "$TARGET_DIR/mako/theme.conf"
makoctl reload

# Rofi
ln -sf "$THEME_PATH/theme-rofi.rasi" "$TARGET_DIR/rofi/theme.rasi"

# Oh my posh
ln -sf "$THEME_PATH/theme-omp.json" "$TARGET_DIR/oh-my-posh/config.json"
