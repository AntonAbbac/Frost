{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./host-packages.nix
    ../../modules/system/default.nix
  ];
  networking.hostName = "desktop";
  stylix = {
    enable = true;
    image = ../../modules/themes/wallpapers/shadow-dio.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  };

  system.stateVersion = "26.05";
}
