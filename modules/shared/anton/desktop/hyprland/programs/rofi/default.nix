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
      terminal = "${pkgs.kitty}/bin/kitty";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
      };

      window = {
        width = mkLiteral "480px";
        border = mkLiteral "2px";
        border-radius = mkLiteral "12px";
        padding = mkLiteral "8px";
      };

      inputbar = {
        padding = mkLiteral "8px";
        border-radius = mkLiteral "8px";
      };

      element = {
        padding = mkLiteral "6px";
        border-radius = mkLiteral "8px";
      };
    };
  };
}
