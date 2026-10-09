_: {
  programs.git = {
    enable = true;
    config.safe.directory = "/etc/dotfiles";
    config = {
      credential.helper = "store";
    };
  };
  programs.ssh.startAgent = true;
}
