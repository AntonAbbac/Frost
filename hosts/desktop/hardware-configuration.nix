{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0a643772-07dd-49fe-8055-a769b5b2d204";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9128-1645";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/3e8932f8-3ce2-492a-b648-0337554ed9d0";
    fsType = "ext4";
    options = ["defaults" "nofail" "exec"];
  };

  systemd.tmpfiles.rules = [
    "d /mnt/storage/steamapps 0777 root root -"
    "Z /mnt/storage/steamapps 0777 root root -"
  ];

  environment.sessionVariables = {
    STEAM_COMPAT_DATA_PATH = "$HOME/.local/share/Steam/steamapps/compatdata";
  };

  environment.systemPackages = with pkgs; [
    r2modman
    steam-run
  ];

  programs.steam.enable = true;

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
