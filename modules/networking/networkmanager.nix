{
  lib,
  config,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      dns = lib.mkIf config.services.resolved.enable "systemd-resolved";
      unmanaged = [
        "interface-name:docker*"
        "type:bridge"
      ];

      wifi = {
        macAddress = "random";
        powersave = true;
        scanRandMacAddress = true;
      };

      ethernet.macAddress = "random";
    };
    enableIPv6 = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
