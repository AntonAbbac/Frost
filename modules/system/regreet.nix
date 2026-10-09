_: {
  services.greetd.enable = true;

  services.displayManager.regreet = {
    enable = true;

    cageArgs = ["-s"];
  };
}
