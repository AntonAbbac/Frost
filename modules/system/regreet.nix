{config, ...}: {
  stylix.targets.regreet.enable = false;

  services.displayManager.regreet = {
    enable = true;

    settings = {
      background = {
        path = config.stylix.image;
        fit = "Cover";
      };

      GTK.application_prefer_dark_theme = true;

      commands = {
        reboot = ["systemctl" "reboot"];
        poweroff = ["systemctl" "poweroff"];
      };

      appearance.greeting_msg = "Welcome to FrostOS!";
    };

    extraCss = ''
      window {
        background-color: transparent;
      }

      frame {
        background-color: rgba(18, 18, 18, 0.85);
        background-image: none;
        border: 1px solid rgba(255, 255, 255, 0.12);
        border-radius: 18px;
        padding: 36px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.8);
      }

      label {
        color: #d4d4d4;
        font-weight: 500;
      }

      entry,
      dropdown button,
      combobox button {
        background-color: rgba(30, 30, 30, 0.9);
        background-image: none;
        color: #ffffff;
        border: 1px solid rgba(255, 255, 255, 0.15);
        border-radius: 10px;
        padding: 10px 14px;
        min-height: 40px;
      }

      entry:focus {
        border-color: #888888;
        background-color: rgba(40, 40, 40, 0.95);
        background-image: none;
      }

      button {
        background-color: rgba(35, 35, 35, 0.8);
        background-image: none;
        color: #aaaaaa;
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 10px;
        padding: 8px 16px;
        margin: 4px;
      }

      button:hover {
        background-color: rgba(55, 55, 55, 0.9);
        background-image: none;
        color: #ffffff;
        border-color: rgba(255, 255, 255, 0.25);
      }

      button.suggested-action {
        background-color: #383838;
        background-image: none;
        color: #ffffff;
        border: 1px solid #555555;
        font-weight: bold;
      }

      button.suggested-action:hover {
        background-color: #4f4f4f;
        background-image: none;
        border-color: #777777;
      }
    '';
  };

  users.users.greeter.extraGroups = ["video" "render"];

  systemd.services.greetd.environment = {
    GDK_BACKEND = "wayland";
    GSK_RENDERER = "cairo";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER = "pixman";
  };
}
