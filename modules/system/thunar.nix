_: {
  programs.xfconf.enable = true;
  programs.thunar.enable = true;
  services.gvfs.enable = true;
  programs.nix-ld.enable = true;
  programs.ssh = {
    enable = true;
    settings = {
      "termux" = {
        hostname = "192.168.0.3";
        user = "u0_a450";
        port = 8022;
        extraOptions = {
          ServerAliveInterval = "15";
          ServerAliveCountMax = "3";
        };
      };
    };
  };
}
