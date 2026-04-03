#!/bin/bash

THEME_DIR="$HOME/.config/lucky-themes"
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
echo "$1" > $TARGET_DIR/current-theme
notify-send "Theme switcher" "Theme switched to: $1"

# Kitty
ln -sf "$THEME_PATH/kitty/theme.conf" "$TARGET_DIR/kitty/theme.conf"
killall -SIGUSR1 kitty 2>/dev/null || true

# Hyprland
ln -sf "$THEME_PATH/hyprland/theme.conf" "$TARGET_DIR/hypr/theme.conf"
hyprctl reload

# Waybar
ln -sf "$THEME_PATH/waybar/style.css" "$TARGET_DIR/waybar/theme.css"
ln -sf "$THEME_PATH/waybar/layout.json" "$TARGET_DIR/waybar/layout.json"
killall -SIGUSR2 waybar 2>/dev/null || true

# Mako
ln -sf "$THEME_PATH/mako/theme.conf" "$TARGET_DIR/mako/theme.conf"
makoctl reload 2>/dev/null || true

# Rofi
ln -sf "$THEME_PATH/rofi/theme.rasi" "$TARGET_DIR/rofi/theme.rasi"

# Oh my posh
ln -sf "$THEME_PATH/oh-my-posh/config.json" "$TARGET_DIR/oh-my-posh/config.json"

# Random wallpaper from theme
SCRIPT_DIR="$HOME/.config/lucky-scripts"
WALLPAPER_DIR="$HOME/.config/lucky-wallpapers/$1"
if [ -d "$WALLPAPER_DIR" ] && [ -n "$(ls -A "$WALLPAPER_DIR" 2>/dev/null)" ]; then
  WALLPAPER=$(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png} 2>/dev/null | shuf -n1)
  if [ -n "$WALLPAPER" ]; then
    "$SCRIPT_DIR/awww-set.sh" "$WALLPAPER"
  fi
fi
