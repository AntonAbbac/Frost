{pkgs, ...}: let
  workspaceSelector = import ./scripts/workspace-selector.nix {inherit pkgs;};
  wallpaperPicker = import ./scripts/wallpaper-picker.nix {inherit pkgs;};
in {
  imports = [
    ./config.nix
    ./keybindings.nix
    ./services/hypridle.nix
    ./services/wlogout.nix
    ./programs/kitty.nix
    ./programs/dunst.nix
    ./programs/rofi.nix
    ./programs/waybar.nix
    ./programs/ytfzf.nix
    ./programs/eww.nix
    ./programs/dock.nix
    ./programs/fastfetch.nix
  ];

  home.packages = with pkgs; [
    workspaceSelector
    wallpaperPicker
    hyprland
    hyprpicker
    hypridle
    hyprlock
    waybar
    awww
    grim
    slurp
    wl-clipboard
    cliphist
    brightnessctl
    playerctl
    pamixer
    pavucontrol
    networkmanagerapplet
    wlogout
    swappy
  ];

  programs.hyprlock.enable = true;
}
