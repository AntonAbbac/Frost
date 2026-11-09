{
  config,
  pkgs,
  ...
}: let
  c = config.lib.stylix.colors;

  rofi-obsidian = pkgs.writeShellScriptBin "rofi-obsidian" ''
    VAULT_PATH="$HOME/Nexus/Projects/Frostwriter/Vault"
    VAULT_NAME="Vault"

    NOTE=$(${pkgs.findutils}/bin/find "$VAULT_PATH" -type f -name "*.md" | ${pkgs.gnused}/bin/sed "s|$VAULT_PATH/||" | ${pkgs.rofi}/bin/rofi -dmenu -i -p "Obsidian:")

    if [ -n "$NOTE" ]; then
        ${pkgs.xdg-utils}/bin/xdg-open "obsidian://open?vault=''${VAULT_NAME}&file=''${NOTE}"
    fi
  '';
in {
  home.packages = [rofi-obsidian];

  xdg.configFile."rofi/launcher.rasi".text = ''
    * {
      bg: #${c.base00}d9;
      bg-alt: #${c.base02}b3;
      fg: #${c.base05};
      accent: #${c.base0C};
      font: "JetBrainsMono Nerd Font 11";
      background-color: transparent;
      text-color: @fg;
    }

    window {
      width: 760px;
      background-color: @bg;
      border: 1px;
      border-color: #${c.base0C}55;
      border-radius: 20px;
      padding: 20px;
    }

    mainbox {
      spacing: 16px;
      children: [inputbar, listview];
    }

    inputbar {
      background-color: @bg-alt;
      border-radius: 12px;
      padding: 12px 16px;
      spacing: 12px;
      children: [prompt, entry];
    }

    prompt {
      text-color: @accent;
    }

    entry {
      placeholder: "Buscar aplicativos...";
      placeholder-color: #${c.base05}80;
    }

    listview {
      columns: 5;
      lines: 3;
      spacing: 10px;
      fixed-columns: true;
      cycle: true;
      dynamic: true;
    }

    element {
      orientation: vertical;
      padding: 14px 6px;
      border-radius: 14px;
      spacing: 8px;
      children: [element-icon, element-text];
    }

    element selected.normal {
      background-color: #${c.base0C}26;
      border: 1px;
      border-color: @accent;
    }

    element-icon {
      size: 52px;
      horizontal-align: 0.5;
    }

    element-text {
      horizontal-align: 0.5;
    }
  '';

  programs.rofi = {
    enable = true;

    settings = {
      terminal = "${pkgs.kitty}/bin/kitty";
      modi = "drun,run,filebrowser,window";
      show-icons = true;
      icon-theme = "Papirus";
      display-drun = "󰀻 Apps";
      display-run = "󰁔 Run";
      display-filebrowser = "󰉋 Files";
      display-window = "󱂬 Windows";
      drun-display-format = "{name}";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      window = {
        width = mkLiteral "550px";
        border = mkLiteral "2px";
        border-radius = mkLiteral "16px";
        padding = mkLiteral "16px";
      };

      mainbox = {
        spacing = mkLiteral "12px";
        children = map mkLiteral ["inputbar" "listview"];
      };

      inputbar = {
        border-radius = mkLiteral "10px";
        padding = mkLiteral "10px 14px";
        spacing = mkLiteral "10px";
        children = map mkLiteral ["prompt" "entry"];
      };

      prompt = {
        font = "JetBrainsMono Nerd Font Bold 11";
      };

      entry = {
        placeholder = "Search...";
      };

      listview = {
        lines = 7;
        columns = 1;
        spacing = mkLiteral "6px";
        cycle = true;
        dynamic = true;
      };

      element = {
        padding = mkLiteral "8px 12px";
        border-radius = mkLiteral "8px";
        spacing = mkLiteral "10px";
        children = map mkLiteral ["element-icon" "element-text"];
      };

      "element-icon" = {
        size = mkLiteral "24px";
      };

      "element-text" = {
        vertical-align = mkLiteral "0.5";
      };
    };
  };
}
