{pkgs, ...}:
pkgs.writeShellScriptBin "workspace-selector" ''
  ROFI="${pkgs.rofi}/bin/rofi"
  HYPRCTL="${pkgs.hyprland}/bin/hyprctl"
  JQ="${pkgs.jq}/bin/jq"

  CHOICE=$(printf "Dev\nNotes (Obsidian)\nComplete (Zed + Obsidian + Librewolf + Steam)\nClear (Fechar todas as janelas)" | $ROFI -dmenu -i -p "Workflow:")

  if [ -z "$CHOICE" ]; then
    exit 0
  fi

  PIDS=$($HYPRCTL clients -j | $JQ -r '.[].pid | select(. != null and . != 0)')
  if [ -n "$PIDS" ]; then
    echo "$PIDS" | while read -r pid; do
      kill -15 "$pid" 2>/dev/null
    done
    sleep 0.2
  fi

  case "$CHOICE" in
    "Dev")
      $HYPRCTL dispatch "hl.dsp.exec_cmd(\"zeditor\")"
      ;;
    "Notes (Obsidian)")
      $HYPRCTL dispatch "hl.dsp.exec_cmd(\"obsidian\")"
      ;;
    "Complete (Zed + Obsidian + Librewolf + Steam)")
      $HYPRCTL dispatch "hl.dsp.exec_cmd(\"zeditor\")"
      $HYPRCTL dispatch "hl.dsp.exec_cmd(\"obsidian\")"
      $HYPRCTL dispatch "hl.dsp.exec_cmd(\"librewolf\")"
      $HYPRCTL dispatch "hl.dsp.exec_cmd(\"steam\")"
      ;;
    "Clear (Fechar todas as janelas)")
      ;;
  esac
''
