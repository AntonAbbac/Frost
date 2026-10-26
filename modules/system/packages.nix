{pkgs, ...}: let
  pkgs-electron30 =
    import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
      sha256 = "1lr1h35prqkd1mkmzriwlpvxcb34kmhc9dnr48gkm8hh089hifmx";
    }) {
      system = pkgs.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
in {
  environment.systemPackages = with pkgs; [
    wget
    unzip
    zip
    (obsidian.override {electron = pkgs-electron30.electron_30;})
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
