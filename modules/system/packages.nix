{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    android-tools
    librewolf
    nodejs
    obsidian
    ollama
    proton-authenticator
    proton-pass
    proton-vpn
    protonmail-desktop
    qbittorrent-enhanced
    rofi-obsidian
    syncthing
    tor-browser
    unzip
    wget
    zip
  ];
}
