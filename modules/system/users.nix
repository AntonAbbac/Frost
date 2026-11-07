{pkgs, ...}: {
  programs.zsh.enable = true;

  users.users = {
    anton = {
      isNormalUser = true;
      extraGroups = [
        "audio"
        "gamemode"
        "input"
        "networkmanager"
        "video"
        "wheel"
        "storage"
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

  security.sudo.wheelNeedsPassword = false;
}
