{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix
    ../../modules/system/default.nix
  ];
  networking.hostName = "desktop";
  stylix = {
    enable = true;
    image = ../../modules/themes/wallpapers/nixos.png;
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };
  };
  system.stateVersion = "26.05";
}
