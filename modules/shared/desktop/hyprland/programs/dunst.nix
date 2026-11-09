{pkgs, ...}: {
  home.packages = with pkgs; [
    dunst
    libnotify
  ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = "(30, 100)";
        offset = "(0, 56)";
        origin = "top-center";
        transparency = 10;
        corner_radius = 10;
      };

      urgency_low = {
        timeout = 5;
      };

      urgency_normal = {
        timeout = 8;
      };

      urgency_critical = {
        timeout = 0;
      };
    };
  };
}
