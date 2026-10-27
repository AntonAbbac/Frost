{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    unzip
    zip
    obsidian # Usa a versão do Electron oficial do seu nixpkgs
    rofi-obsidian
    proton-pass
    proton-vpn
    protonmail-desktop
    proton-authenticator
    syncthing
    librewolf
    tor-browser
    nodejs
  ];

  nixpkgs.config.allowUnfree = true;
}
