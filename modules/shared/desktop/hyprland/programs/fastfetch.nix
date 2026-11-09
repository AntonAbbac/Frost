_: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        color = {
          "1" = "cyan";
          "2" = "blue";
        };
        padding = {
          top = 1;
          right = 4;
        };
      };
      display.separator = "  ";
      modules = [
        "title"
        "separator"
        {
          type = "os";
          key = "OS   ";
        }
        {
          type = "wm";
          key = "WM   ";
        }
        {
          type = "shell";
          key = "SH   ";
        }
        {
          type = "cpu";
          key = "CPU  ";
        }
        {
          type = "gpu";
          key = "GPU  ";
        }
        {
          type = "memory";
          key = "RAM  ";
        }
        {
          type = "packages";
          key = "PKGS ";
        }
        "break"
        "colors"
      ];
    };
  };
}
