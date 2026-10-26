{pkgs, ...}: {
  users.users.anton = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "input"
    ]; # Enable `sudo` for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}
