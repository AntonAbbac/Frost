{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["JetBrainsMono Nerd Font"];
      sansSerif = ["JetBrainsMono Nerd Font"];
      serif = ["JetBrainsMono Nerd Font"];
      emoji = ["Noto Color Emoji"];
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts-color-emoji
  ];
}
