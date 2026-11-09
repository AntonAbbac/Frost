{pkgs, ...}: {
  boot = {
    kernelParams = ["video=DVI-D-1:1920x1080@60e"];
    kernelPackages = pkgs.linuxPackages_zen;
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
