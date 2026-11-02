{
  config,
  pkgs,
  ...
}: let
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

  programs.rofi = {
    enable = true;

    settings = {
      font = config.stylix.fonts.monospace.name;
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
        placeholder = "Pesquisar...";
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
