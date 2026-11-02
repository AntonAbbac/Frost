{lib, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;

    settings = {
      fileManager = {_var = "thunar";};
      mainMod = {_var = "SUPER";};
      menu = {_var = "rofi -show drun";};
      terminal = {_var = "kitty";};
      screenshotDir = {_var = lib.generators.mkLuaInline ''os.getenv("HOME") .. "/Pictures/Screenshots"'';};

      config = {
        general = {
          gaps_in = 6;
          gaps_out = 12;
          border_size = 2;
          resize_on_border = true;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 12;
          active_opacity = 1.0;
          inactive_opacity = 0.95;
          blur = {
            enabled = true;
            size = 6;
            passes = 3;
            new_optimizations = true;
            ignore_opacity = true;
          };
          shadow = {
            enabled = true;
            range = 15;
            render_power = 3;
          };
        };

        animations = {
          enabled = true;
          bezier = [
            "wind, 0.05, 0.9, 0.1, 1.05"
            "winIn, 0.1, 1.1, 0.1, 1.1"
            "winOut, 0.3, -0.3, 0, 1"
            "liner, 1, 1, 1, 1"
          ];
          animation = [
            "windows, 1, 6, wind, slide"
            "windowsIn, 1, 6, winIn, slide"
            "windowsOut, 1, 5, winOut, slide"
            "windowsMove, 1, 5, wind, slide"
            "border, 1, 1, liner"
            "fade, 1, 10, default"
            "workspaces, 1, 5, wind"
          ];
        };

        dwindle = {
          preserve_split = true;
          smart_split = false;
          smart_resizing = true;
        };

        master = {
          new_status = "master";
        };

        input = {
          kb_layout = "br";
          kb_variant = "abnt2";
          kb_model = "thinkpad";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = {
            natural_scroll = false;
          };
        };

        monitor = [",preferred,auto,auto"];

        env = [
          "HYPRCURSOR_THEME,Bibata-Modern-Classic"
          "HYPRCURSOR_SIZE,20"
          "XCURSOR_THEME,Bibata-Modern-Classic"
          "XCURSOR_SIZE,20"
          "NIXOS_OZONE_WL,1"
          "QT_QPA_PLATFORM,wayland;xcb"
          "QT_QPA_PLATFORMTHEME,qt5ct"
          "MOZ_ENABLE_WAYLAND,1"
        ];

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          force_default_wallpaper = 0;
          vrr = 1;
        };
      };

      on = [
        {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline ''
              function()
                hl.exec_cmd("waybar")
                hl.exec_cmd("swww-daemon")
                hl.exec_cmd("swww img /etc/dotfiles/modules/themes/wallpapers/firewatch.png")
                hl.exec_cmd("wl-paste --type text --watch cliphist store")
                hl.exec_cmd("wl-paste --type image --watch cliphist store")
                hl.exec_cmd("nm-applet")
                hl.exec_cmd("dunst")
                hl.exec_cmd("hypridle")
                hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
                hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
                hl.exec_cmd("syncthing")
                hl.exec_cmd("workspace-selector")
              end
            '')
          ];
        }
      ];

      window_rule = [
        {
          match = {class = ".*";};
          suppress_event = "maximize";
        }
        {
          match = {class = "^(md.obsidian.Obsidian)$";};
          workspace = "1 silent";
          float = true;
          size = "800 600";
          center = true;
        }
        {
          match = {class = "^(dev.zed.Zed)$";};
          workspace = "2 silent";
          float = false;
          size = "800 600";
          center = false;
        }
        {
          match = {class = "^(steam)$";};
          workspace = "3 silent";
          float = false;
          size = "800 600";
          center = false;
        }
        {
          match = {class = "^(librewolf)$";};
          workspace = "special:magic";
          float = false;
          size = "800 600";
          center = true;
        }
        {
          match = {class = "^(Slack)$";};
          workspace = "9 silent";
        }
        {
          match = {class = "^(pavucontrol)$";};
          float = true;
          size = "800 600";
          center = true;
        }
        {
          match = {class = "^(nm-connection-editor)$";};
          float = true;
          center = true;
        }
        {
          match = {class = "^(blueman-manager)$";};
          float = true;
          size = "700 500";
          center = true;
        }
        {
          match = {title = "^(Picture-in-Picture)$";};
          float = true;
          pin = true;
        }
      ];
    };
  };
}
