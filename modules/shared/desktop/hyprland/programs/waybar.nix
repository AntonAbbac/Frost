{config, ...}: let
  c = config.lib.stylix.colors;
  rgba = name: a: "rgba(${c."${name}-rgb-r"}, ${c."${name}-rgb-g"}, ${c."${name}-rgb-b"}, ${a})";
in {
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 38;
      margin-top = 8;
      margin-left = 12;
      margin-right = 12;

      modules-left = ["hyprland/workspaces" "hyprland/window"];
      modules-center = ["clock"];
      modules-right = ["tray" "pulseaudio" "network" "bluetooth" "battery" "custom/power"];

      "hyprland/workspaces" = {
        disable-scroll = true;
        format = "{name}";
        on-click = "activate";
        persistent-workspaces = {"*" = 5;};
      };

      "hyprland/window" = {
        format = "󱂬  {class}";
        max-length = 30;
        separate-outputs = true;
        rewrite = {"󱂬  " = "󱂬  Hyprland";};
      };

      clock = {
        format = "{:%a, %d de %b   %H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "󰝟 Mute";
        format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
        on-click = "pamixer -t";
        on-click-right = "pavucontrol";
      };

      network = {
        format-wifi = "󰤨";
        format-ethernet = "󰀂";
        format-disconnected = "󰖪";
        tooltip-format = "{essid} ({signalStrength}%)";
        on-click-right = "nm-connection-editor";
      };

      bluetooth = {
        format = "󰂯";
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-connected = "󰂱 {num_connections}";
        tooltip-format-connected = "{controller_alias}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        on-click = "blueman-manager";
      };

      battery = {
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = " {capacity}%";
        format-icons = ["󰂎" "󰁺" "󰁼" "󰁽" "󰁿" "󰂁" "󰁹"];
        states = {
          warning = 30;
          critical = 15;
        };
      };

      tray = {
        icon-size = 16;
        spacing = 10;
      };

      "custom/power" = {
        format = "󰐥";
        tooltip = false;
        on-click = "wlogout";
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: ${rgba "base00" "0.40"};
        border: 1px solid ${rgba "base0C" "0.25"};
        border-radius: 16px;
        color: #${c.base05};
      }

      #workspaces {
        margin: 4px 6px;
      }

      #workspaces button {
        padding: 0 10px;
        margin: 2px 3px;
        border-radius: 10px;
        color: #${c.base05};
        background: transparent;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button:hover {
        background: ${rgba "base0C" "0.20"};
      }

      #workspaces button.active {
        background: #${c.base0C};
        color: #${c.base00};
        font-weight: bold;
      }

      #workspaces button.urgent {
        background: #${c.base08};
        color: #${c.base00};
      }

      #window {
        background: ${rgba "base00" "0.40"};
        padding: 0 12px;
        border-radius: 10px;
        color: #${c.base0D};
      }

      #clock {
        font-size: 14px;
        font-weight: bold;
      }

      #pulseaudio,
      #network,
      #bluetooth,
      #battery,
      #tray,
      #custom-power {
        padding: 0 12px;
      }

      #battery.warning {
        color: #${c.base09};
      }

      #battery.critical {
        color: #${c.base08};
        animation: blink 0.5s alternate infinite;
      }

      #custom-power {
        color: #${c.base08};
      }

      @keyframes blink {
        to {
          opacity: 0.4;
        }
      }

      tooltip {
        background: ${rgba "base00" "0.90"};
        border: 1px solid ${rgba "base0C" "0.30"};
        border-radius: 10px;
      }

      tooltip label {
        color: #${c.base05};
        padding: 6px;
      }
    '';
  };
}
