{pkgs, ...}: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  programs.xfconf.enable = true;
  programs.nix-ld.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
    file-roller
    ntfs3g
    p7zip
    poppler_gi
    unrar
    unzip
  ];
}
