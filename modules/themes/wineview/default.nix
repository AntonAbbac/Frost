{pkgs, ...}: {
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "190a10";
      base01 = "241018";
      base02 = "361724";
      base03 = "542438";
      base04 = "783752";
      base05 = "f0e2e7";
      base06 = "f7eff2";
      base07 = "ffffff";

      base08 = "e63946";
      base09 = "f4a261";
      base0A = "e7c169";
      base0B = "a8d5ba";
      base0C = "9c88ff";
      base0D = "c97395";
      base0E = "800f2f";
      base0F = "590d22";
    };
    polarity = "light";
    image = ../../themes/wallpapers/lelouch.jpg;
    opacity = {
      terminal = 0.85;
      popups = 0.90;
      applications = 1.0;
    };

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

      sizes = {
        applications = 11;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };
  };
}
