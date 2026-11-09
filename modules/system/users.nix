{pkgs, ...}: {
  programs.zsh.enable = true;

  users.users = {
    anton = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "disk"
        "audio"
        "video"
        "input"
        "storage"
        "networkmanager"
        "systemd-journal"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        tree
      ];
    };

    miraven = {
      isNormalUser = true;
      extraGroups = [
        "audio"
        "gamemode"
        "input"
        "networkmanager"
        "video"
        "wheel"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        tree
      ];
    };
  };

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  environment.systemPackages = with pkgs; [
    (makeDesktopItem {
      name = "thunar-root";
      desktopName = "Thunar (Root Total)";
      exec = "pkexec thunar %F";
      icon = "org.xfce.thunar";
      categories = ["System" "FileTools" "FileManager"];
    })
  ];
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
