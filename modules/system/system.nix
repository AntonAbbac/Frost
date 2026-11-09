{pkgs, ...}: {
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";

  console.keyMap = "br-abnt2";

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    trusted-users = [
      "root"
      "anton"
    ];
  };

  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
    };
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  security.polkit.enable = true;
}
