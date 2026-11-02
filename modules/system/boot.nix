_: {
  boot = {
    plymouth.enable = true;

    loader = {
      systemd-boot.enable = false;

      efi = {
        canTouchEfiVariables = true;
      };

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
	efiInstallAsRemovable = false;
      };
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024; # 8 GB
    }
  ];
}
