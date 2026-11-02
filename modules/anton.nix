{...}: {
  imports = [
    ./shared/desktop/hyprland
    ./shared/desktop/hyprland/programs/kitty
    ./shared/desktop/hyprland/programs/dunst
    ./shared/desktop/hyprland/programs/rofi
    ./shared/desktop/hyprland/programs/waybar
    ./shared/desktop/hyprland/programs/ytfzf
    ./shared/programming/default.nix
    ./themes/unsent-letters/default.nix
  ];

  home.stateVersion = "26.05";
}
