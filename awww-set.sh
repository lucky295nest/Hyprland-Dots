#!/bin/bash

[ -z "$1" ] && echo "Usage: ./awww-set.sh <wallpaper-path>" && exit 1

awww img "$1" \
  --transition-type wipe \
  --transition-angle 30 \
  --transition-duration 1 \
  --transition-fps 60
