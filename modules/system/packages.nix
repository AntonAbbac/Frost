{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    unzip
    zip
    obsidian
    nixd
    gh
    proton-pass
    proton-vpn
    protonmail-desktop
    proton-authenticator
    syncthing
    alejandra
    librewolf
    tor-browser
    nodejs
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
  nixpkgs.config.allowUnfree = true;
}
