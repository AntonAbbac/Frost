_: {
  programs.git = {
    enable = true;
    config = {
      safe.directory = "/etc/dotfiles";
      credential.helper = "store";
      init.defaultBranch = "main";
    };
  };
}
