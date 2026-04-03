#!/bin/bash
CURRENT_THEME=$(cat "$HOME/.config/current-theme" 2>/dev/null)

if [ -z "$CURRENT_THEME" ]; then
  notify-send "Wallpaper Picker" "No current theme set. Run theme-switcher.sh first."
  exit 1
fi

WALLPAPER_DIR=".config/lucky-wallpapers/$CURRENT_THEME"

if [ ! -d "$WALLPAPER_DIR" ] || [ -z "$(ls -A "$WALLPAPER_DIR" 2>/dev/null)" ]; then
  notify-send "Wallpaper Picker" "No wallpapers found for theme: $CURRENT_THEME"
  exit 1
fi

CACHE_DIR="$HOME/.cache/wallpaper-picker/$CURRENT_THEME"
mkdir -p "$CACHE_DIR"

ENTRIES=""
for IMG in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
  [ -f "$IMG" ] || continue
  FILENAME=$(basename "$IMG")
  THUMB="$CACHE_DIR/$FILENAME.png"

  if [ ! -f "$THUMB" ]; then
    magick "$IMG" -thumbnail 400x225^ -gravity center -extent 400x225 "$THUMB" 2>/dev/null
  fi

  ENTRIES+="$FILENAME\0icon\x1f$THUMB\n"
done

PICK=$(printf "$ENTRIES" | rofi \
  -dmenu \
  -p "🖼 $CURRENT_THEME" \
  -show-icons \
  -theme-str 'listview { columns: 3; lines: 3; }' \
  -theme-str 'element { orientation: vertical; }' \
  -theme-str 'element-icon { size: 200px; }' \
  -theme-str 'element-text { horizontal-align: 0.5; }')

[ -z "$PICK" ] && exit 0

"$(cd "$(dirname "$0")" && pwd)/awww-set.sh" "$WALLPAPER_DIR/$PICK"

notify-send "Wallpaper" "Changed to: $PICK"
