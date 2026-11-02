{lib, ...}: {
  wayland.windowManager.hyprland.settings.bind = [
    {_args = ["SUPER + Q" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")];}
    {_args = ["SUPER + C" (lib.generators.mkLuaInline "hl.dsp.window.close()")];}
    {_args = ["SUPER + M" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wlogout\")")];}
    {_args = ["SUPER + SHIFT + M" (lib.generators.mkLuaInline "hl.dsp.exit()")];}
    {_args = ["SUPER + E" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(fileManager)")];}
    {_args = ["SUPER + V" (lib.generators.mkLuaInline "hl.dsp.window.float({ action = \"toggle\" })")];}
    {_args = ["SUPER + R" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(menu)")];}
    {_args = ["SUPER + P" (lib.generators.mkLuaInline "hl.dsp.window.pseudo()")];}
    {_args = ["SUPER + J" (lib.generators.mkLuaInline ''hl.dsp.layout("togglesplit")'')];}
    {_args = ["SUPER + F" (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")];}
    {_args = ["SUPER + L" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprlock\")")];}
    {_args = ["SUPER + X" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"cliphist list | rofi -dmenu | cliphist decode | wl-copy\")")];}
    {_args = ["SUPER + Y" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ytfzf\")")];}
    {_args = ["SUPER + O" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"rofi-obsidian\")")];}
    {_args = ["SUPER + SHIFT + W" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"workspace-selector\")")];}

    {_args = ["SUPER + left" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "left" })'')];}
    {_args = ["SUPER + right" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "right" })'')];}
    {_args = ["SUPER + up" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "up" })'')];}
    {_args = ["SUPER + down" (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "down" })'')];}

    {_args = ["SUPER + 1" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 1 })")];}
    {_args = ["SUPER + 2" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 2 })")];}
    {_args = ["SUPER + 3" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 3 })")];}
    {_args = ["SUPER + 4" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 4 })")];}
    {_args = ["SUPER + 5" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 5 })")];}
    {_args = ["SUPER + 6" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 6 })")];}
    {_args = ["SUPER + 7" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 7 })")];}
    {_args = ["SUPER + 8" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 8 })")];}
    {_args = ["SUPER + 9" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 9 })")];}
    {_args = ["SUPER + 0" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 10 })")];}

    {_args = ["SUPER + SHIFT + 1" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 1 })")];}
    {_args = ["SUPER + SHIFT + 2" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 2 })")];}
    {_args = ["SUPER + SHIFT + 3" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 3 })")];}
    {_args = ["SUPER + SHIFT + 4" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 4 })")];}
    {_args = ["SUPER + SHIFT + 5" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 5 })")];}
    {_args = ["SUPER + SHIFT + 6" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 6 })")];}
    {_args = ["SUPER + SHIFT + 7" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 7 })")];}
    {_args = ["SUPER + SHIFT + 8" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 8 })")];}
    {_args = ["SUPER + SHIFT + 9" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 9 })")];}
    {_args = ["SUPER + SHIFT + 0" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 10 })")];}

    {_args = ["SUPER + S" (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("magic")'')];}
    {_args = ["SUPER + SHIFT + S" (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = "special:magic" })'')];}
    {_args = ["SUPER + SHIFT + L" (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("special:librewolf")'')];}

    {_args = ["SUPER + mouse_down" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e+1" })'')];}
    {_args = ["SUPER + mouse_up" (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "e-1" })'')];}

    {_args = ["Print" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]])'')];}
    {_args = ["SUPER + Print" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[grim - | wl-copy]])'')];}
    {_args = ["SUPER + SHIFT + Print" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("mkdir -p " .. screenshotDir .. " && grim " .. screenshotDir .. "/$(date +%Y-%m-%d_%H-%M-%S).png")'')];}

    {
      _args = ["SUPER + mouse:272" (lib.generators.mkLuaInline "hl.dsp.window.drag()")];
      mouse = true;
    }
    {
      _args = ["SUPER + mouse:273" (lib.generators.mkLuaInline "hl.dsp.window.resize()")];
      mouse = true;
    }

    {
      _args = ["XF86AudioRaiseVolume" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[pamixer -i 5 && dunstify -a "volume" -u low -i audio-volume-high -h int:value:$(pamixer --get-volume) -h string:x-dunst-stack-tag:volume "Volume: $(pamixer --get-volume)%"]])'')];
      locked = true;
    }
    {
      _args = ["XF86AudioLowerVolume" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[pamixer -d 5 && dunstify -a "volume" -u low -i audio-volume-low -h int:value:$(pamixer --get-volume) -h string:x-dunst-stack-tag:volume "Volume: $(pamixer --get-volume)%"]])'')];
      locked = true;
    }
    {
      _args = ["XF86AudioMute" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[pamixer -t]])'')];
      locked = true;
    }
    {
      _args = ["XF86MonBrightnessUp" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[brightnessctl -e4 -n2 set 5%+ && dunstify -a "brightness" -u low -i display-brightness-high -h string:x-dunst-stack-tag:brightness "Brilho: $(brightnessctl -m | cut -d, -f4)"]])'')];
      locked = true;
    }
    {
      _args = ["XF86MonBrightnessDown" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[brightnessctl -e4 -n2 set 5%- && dunstify -a "brightness" -u low -i display-brightness-low -h string:x-dunst-stack-tag:brightness "Brilho: $(brightnessctl -m | cut -d, -f4)"]])'')];
      locked = true;
    }
    {
      _args = ["XF86AudioNext" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl next]])'')];
      locked = true;
    }
    {
      _args = ["XF86AudioPause" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl play-pause]])'')];
      locked = true;
    }
    {
      _args = ["XF86AudioPlay" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl play-pause]])'')];
      locked = true;
    }
    {
      _args = ["XF86AudioPrev" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl previous]])'')];
      locked = true;
    }

    {
      _args = ["SUPER + ALT + space" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl play-pause]])'')];
      locked = true;
    }
    {
      _args = ["SUPER + ALT + right" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl position 5+]])'')];
      locked = true;
    }
    {
      _args = ["SUPER + ALT + left" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl position 5-]])'')];
      locked = true;
    }
    {
      _args = ["SUPER + ALT + up" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl next]])'')];
      locked = true;
    }
    {
      _args = ["SUPER + ALT + down" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[playerctl previous]])'')];
      locked = true;
    }

    {
      _args = ["switch:on:Lid Switch" (lib.generators.mkLuaInline ''hl.dsp.exec_cmd([[hyprlock]])'')];
      locked = true;
    }
  ];
}
