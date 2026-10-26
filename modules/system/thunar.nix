{pkgs, ...}: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  programs.xfconf.enable = true;
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
    poppler_gi
    file-roller
    p7zip
    unzip
    unrar
    ntfs3g
  ];
}
