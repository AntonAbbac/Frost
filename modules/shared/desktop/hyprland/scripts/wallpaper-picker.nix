{pkgs, ...}:
pkgs.writeShellScriptBin "wallpaper-picker" ''
  ROFI="${pkgs.rofi}/bin/rofi"
  AWWW="${pkgs.awww}/bin/awww"
  AWWW_DAEMON="${pkgs.awww}/bin/awww-daemon"
  FIND="${pkgs.findutils}/bin/find"
  BASENAME="${pkgs.coreutils}/bin/basename"

  WALL_DIR="/etc/Frost/modules/themes/wallpapers"

  if ! $AWWW query >/dev/null 2>&1; then
    $AWWW_DAEMON &
    sleep 0.5
  fi

  PICS=($($FIND "$WALL_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \)))

  ROFI_STYLE='
    window { width: 55%; height: 60%; border-radius: 14px; }
    element { orientation: vertical; padding: 10px; border-radius: 10px; }
    element-icon { size: 140px; horizontal-align: 0.5; }
    element-text { horizontal-align: 0.5; }
    listview { columns: 4; lines: 2; spacing: 12px; }
  '

  SELECTED=$(
    for pic in "''${PICS[@]}"; do
      filename=$($BASENAME "$pic")
      printf "%s\0icon\x1f%s\n" "$filename" "$pic"
    done | $ROFI -dmenu -i -p "Wallpapers" -theme-str "$ROFI_STYLE"
  )

  if [ -n "$SELECTED" ]; then
    $AWWW img "$WALL_DIR/$SELECTED" \
      --transition-type outer \
      --transition-pos top-right \
      --transition-step 90 \
      --transition-fps 60
  fi
''
