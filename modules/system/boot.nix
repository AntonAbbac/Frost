{pkgs, ...}: {
  boot = {
    plymouth.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;
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
