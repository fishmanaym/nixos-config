_:

{
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      unmanaged = [
        "interface-name:docker*"
        "type:bridge"
      ];

      wifi = {
    #    macAddress = "random";
        powersave = true;
        scanRandMacAddress = true;
      };

    #  ethernet.macAddress = "random"; # TODO: add later, needed to remove for vm
    };
    enableIPv6 = true;
  };
}
