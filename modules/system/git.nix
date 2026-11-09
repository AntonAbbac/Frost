_: {
  programs.git = {
    enable = true;
    config = {
      safe.directory = "/etc/Frost";
      credential.helper = "store";
      init.defaultBranch = "main";
    };
  };
}
