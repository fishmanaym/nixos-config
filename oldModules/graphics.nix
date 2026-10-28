{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = false;
    branch = "legacy_580";
    nvidiaSettings = true; # nvidia-settings
    modesetting.enable = true;

    prime = {
      # this shouldn't work for pascal architecture but it seems to work? im not sure tbh
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      nvidiaBusId = "PCI:1@0:0:0";
      amdgpuBusId = "PCI:5@0:0:0";
    };
  };

  nixpkgs.config.allowUnfree = true;
}
