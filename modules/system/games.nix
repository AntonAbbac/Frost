{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
    ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    bottles
    steam-run
    r2modman
    lutris
    prismlauncher
    pciutils
    hydralauncher
    protonup-qt
    wine
    protontricks
    wineWowPackages.stable
  ];

  programs = {
    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
        };
      };
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = [pkgs.proton-ge-bin];

      extraPackages = with pkgs; [
        mangohud
        gamescope
      ];

      gamescopeSession = {
        enable = true;
        args = [
          "--rt"
          "--expose-wayland"
        ];
      };
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      package = pkgs.gamescope;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };

  environment.sessionVariables = {
    MANGOHUD = "1";
  };

  home-manager.sharedModules = [
    (_: {
      programs.mangohud = {
        enable = true;
        enableSessionWide = true;

        settingsPerApplication = {
          mpv = {
            no_display = true;
          };
        };

        settings = {
          no_display = true;

          fps_limit = [
            60
            0
            144
            165
            240
          ];
          fps_limit_method = "late";
          vsync = 2;
          gl_vsync = 1;

          toggle_hud = "Shift_R+F12";
          toggle_fps_limit = "Shift_R+F1";

          fps = true;
          show_fps_limit = true;
          frametime = true;
          frame_timing = true;
          present_mode = true;
          core_load = false;
          ram = true;

          cpu_stats = true;
          cpu_temp = true;
          cpu_power = true;
          cpu_text = "CPU";
          cpu_mhz = true;

          throttling_status = true;
          gpu_stats = true;
          gpu_temp = true;
          gpu_core_clock = true;
          gpu_mem_clock = true;
          gpu_power = true;
          gpu_text = "GPU";
          vram = true;
        };
      };
    })
  ];
}
