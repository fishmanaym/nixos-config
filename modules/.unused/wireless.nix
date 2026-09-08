_:
# i was going to make it this way but regreted
{
  networking = {
    wireless = {
      enable = true;
      userControlled = true;

      iwd = {
        enable = false;
        settings = {
          Settings.AutoConnect = true;

          General = {
            AddressRandomization = "network";
            AddressRandomizationRange = "full";
          };

          Network = {
            EnableIPv6 = true;
          };
        };
      };
    };
  };
  enableIPv6 = true;
}
