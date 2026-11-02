{pkgs, ...}: {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "󰌾  Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "${pkgs.hyprland}/bin/hyprctl dispatch 'hl.dsp.exit()'";
        text = "󰍃  Logout";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "${pkgs.systemd}/bin/systemctl suspend";
        text = "󰤄  Suspend";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "${pkgs.systemd}/bin/systemctl reboot";
        text = "󰜉  Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "${pkgs.systemd}/bin/systemctl poweroff";
        text = "󰐥  Shutdown";
        keybind = "p";
      }
    ];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
        box-shadow: none;
      }

      window {
        background-color: transparent;
      }

      button {
        border-radius: 16px;
        border-width: 2px;
        border-style: solid;
        margin: 12px;
        padding: 10px;
        transition: all 0.2s ease-in-out;
      }

      button:focus,
      button:active,
      button:hover {
        border-radius: 24px;
      }
    '';
  };
}
