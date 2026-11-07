_: {
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
    options iwlmvm power_scheme=1
  '';
  boot.kernelParams = ["pcie_aspm=off"];
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    nftables.enable = true;
    firewall = {
      enable = true;
      allowPing = false;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
    ];
  };
}
