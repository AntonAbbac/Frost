{
  config,
  pkgs,
  ...
}: let
  c = config.lib.stylix.colors;
  rgba = name: a: "rgba(${c."${name}-rgb-r"}, ${c."${name}-rgb-g"}, ${c."${name}-rgb-b"}, ${a})";

  playerProgress = pkgs.writeShellScript "player-progress" ''
    p=$(${pkgs.playerctl}/bin/playerctl position 2>/dev/null) || { echo 0; exit; }
    l=$(${pkgs.playerctl}/bin/playerctl metadata mpris:length 2>/dev/null)
    [ -z "$l" ] || [ "$l" = 0 ] && { echo 0; exit; }
    ${pkgs.gawk}/bin/awk -v p="$p" -v l="$l" 'BEGIN { printf "%d", p * 100000000 / l }'
  '';
in {
  home.packages = [pkgs.eww pkgs.playerctl];

  xdg.configFile."eww/eww.yuck".text = ''
    (defpoll time :interval "10s" "date +%H:%M")
    (defpoll date :interval "60s" "LC_TIME=pt_BR.UTF-8 date '+%A, %d de %B'")

    (deflisten song :initial "Nada tocando" "playerctl --follow metadata --format '{{ title }}'")
    (deflisten artist :initial "" "playerctl --follow metadata --format '{{ artist }}'")
    (deflisten status :initial "Paused" "playerctl --follow status")
    (defpoll progress :interval "1s" :initial 0 "${playerProgress}")

    (defwidget metric [name value]
      (box :orientation "v" :space-evenly false :spacing 4
        (box :space-evenly false
          (label :class "metric-name" :text name :halign "start" :hexpand true)
          (label :class "metric-value" :text "''${value}%"))
        (progress :class "bar" :orientation "h" :value value)))

    (defwidget dashboard []
      (box :class "card" :orientation "v" :space-evenly false :spacing 14
        (box :orientation "v" :space-evenly false
          (label :class "clock" :halign "start" :text time)
          (label :class "date" :halign "start" :text date))
        (metric :name "CPU" :value {round(EWW_CPU.avg, 0)})
        (metric :name "RAM" :value {round(EWW_RAM.used_mem_perc, 0)})
        (metric :name "DISK" :value {round(EWW_DISK["/"].used_perc, 0)})))

    (defwidget player []
      (box :class "card" :orientation "v" :space-evenly false :spacing 8
        (label :class "song" :halign "start" :limit-width 28 :text song)
        (label :class "artist" :halign "start" :limit-width 28 :text artist)
        (progress :class "bar" :orientation "h" :value progress)
        (box :halign "center" :space-evenly false :spacing 10
          (button :class "ctl" :onclick "playerctl previous" "󰒮")
          (button :class "ctl" :onclick "playerctl play-pause" {status == "Playing" ? "󰏤" : "󰐊"})
          (button :class "ctl" :onclick "playerctl next" "󰒭"))))

    (defwindow dashboard
      :monitor 0
      :namespace "eww-dashboard"
      :geometry (geometry :x "24px" :y "16px" :width "300px" :anchor "top right")
      :stacking "bg"
      :exclusive false
      :focusable false
      (dashboard))

    (defwindow player
      :monitor 0
      :namespace "eww-player"
      :geometry (geometry :x "24px" :y "24px" :width "300px" :anchor "bottom right")
      :stacking "bg"
      :exclusive false
      :focusable false
      (player))
  '';

  xdg.configFile."eww/eww.scss".text = ''
    * {
      all: unset;
      font-family: "JetBrainsMono Nerd Font";
    }

    .card {
      background: ${rgba "base00" "0.60"};
      border: 1px solid ${rgba "base0C" "0.25"};
      border-radius: 18px;
      padding: 20px;
      color: #${c.base05};
    }

    .clock {
      font-size: 44px;
      font-weight: bold;
    }

    .date {
      font-size: 13px;
      color: ${rgba "base05" "0.70"};
    }

    .metric-name,
    .metric-value {
      font-size: 13px;
    }

    .bar trough {
      background: ${rgba "base05" "0.12"};
      border-radius: 99px;
      min-height: 6px;
    }

    .bar progress {
      background: #${c.base0C};
      border-radius: 99px;
      min-height: 6px;
    }

    .song {
      font-size: 16px;
      font-weight: bold;
    }

    .artist {
      font-size: 13px;
      color: ${rgba "base05" "0.70"};
    }

    .ctl {
      font-size: 20px;
      padding: 0 10px;
    }

    .ctl:hover {
      color: #${c.base0C};
    }
  '';
}
