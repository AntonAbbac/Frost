{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 36;
      margin-top = 8;
      margin-left = 12;
      margin-right = 12;

      modules-left = ["custom/launcher" "hyprland/workspaces"];
      modules-center = ["clock"];
      modules-right = ["cpu" "memory" "pulseaudio" "network" "bluetooth" "battery" "tray"];

      "custom/launcher" = {
        format = "󱄅";
        on-click = "rofi -show drun";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        active-only = false;
        disable-scroll = true;
        format = "{name}";
        on-click = "activate";
      };

      clock = {
        format = "󰥔 {:%H:%M}";
        format-alt = "󰃭 {:%A, %d de %B}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      cpu = {
        format = "󰍛 {usage}%";
        interval = 2;
        states = {
          warning = 70;
          critical = 90;
        };
      };

      memory = {
        format = "󰑹 {percentage}%";
        interval = 2;
        states = {
          warning = 70;
          critical = 90;
        };
      };

      network = {
        format-wifi = "󰤨 {signalStrength}%";
        format-ethernet = "󰀂";
        format-disconnected = "󰖪";
        tooltip-format = "{essid} ({signalStrength}%)";
      };

      bluetooth = {
        format = "";
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-connected = "󰂱 {num_connections}";
        format-connected-battery = "󰂱 {device_battery_percentage}%";
        tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} conectado(s)";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} conectado(s):\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        on-click = "blueman-manager";
      };

      battery = {
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = " {capacity}%";
        format-icons = ["󰂎" "󰁺" "󰁼" "󰁽" "󰁿" "󰂁" "󰁹"];
        states = {
          warning = 30;
          critical = 15;
        };
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "󰝟 Mute";
        format-icons = {
          default = ["󰕿" "󰖀" "󰕾"];
        };
        on-click = "pamixer -t";
        on-click-right = "pavucontrol";
      };

      tray = {
        icon-size = 16;
        spacing = 10;
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
        background: transparent;
      }

      #custom-launcher,
      #workspaces,
      #clock,
      #cpu,
      #memory,
      #pulseaudio,
      #network,
      #bluetooth,
      #battery,
      #tray {
        border-radius: 12px;
        padding: 4px 12px;
        margin: 0 3px;
        transition: all 0.3s ease;
      }

      #custom-launcher {
        font-size: 16px;
        padding: 4px 14px;
      }

      #workspaces {
        padding: 2px 4px;
      }

      #workspaces button {
        padding: 2px 8px;
        margin: 2px 2px;
        border-radius: 8px;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.active {
        font-weight: bold;
      }

      #workspaces button.urgent {
        font-weight: bold;
      }

      .critical {
        animation: blink 0.5s alternate infinite;
      }

      @keyframes blink {
        to {
          opacity: 0.4;
        }
      }

      tooltip {
        border-radius: 10px;
      }

      tooltip label {
        padding: 6px;
      }
    '';
  };
}
