{
  config,
  pkgs,
  ...
}: let
  c = config.lib.stylix.colors;
  rgba = name: a: "rgba(${c."${name}-rgb-r"}, ${c."${name}-rgb-g"}, ${c."${name}-rgb-b"}, ${a})";

  gridIcon = pkgs.writeText "launcher-grid.svg" ''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#${c.base0D}">
      <circle cx="5"  cy="5"  r="2"/><circle cx="12" cy="5"  r="2"/><circle cx="19" cy="5"  r="2"/>
      <circle cx="5"  cy="12" r="2"/><circle cx="12" cy="12" r="2"/><circle cx="19" cy="12" r="2"/>
      <circle cx="5"  cy="19" r="2"/><circle cx="12" cy="19" r="2"/><circle cx="19" cy="19" r="2"/>
    </svg>
  '';
in {
  xdg.configFile."nwg-dock-hyprland/launcher.svg".source = gridIcon;

  home.packages = [pkgs.nwg-dock-hyprland];

  xdg.configFile."nwg-dock-hyprland/style.css".text = ''
    window {
      background: ${rgba "base00" "0.55"};
      border: 1px solid ${rgba "base0C" "0.25"};
      border-radius: 18px;
    }

    #box {
      padding: 6px 10px;
    }

    button,
    image {
      background: none;
      border: none;
      box-shadow: none;
    }

    button {
      padding: 4px;
      margin: 0 4px;
      border-radius: 12px;
    }

    button:hover {
      background: ${rgba "base0C" "0.18"};
    }

    #active {
      border-bottom: 2px solid #${c.base0C};
    }
  '';
}
