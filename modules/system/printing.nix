{...}: {
  flake.nixosModules.printing = {...}: {
    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable Avahi for discovery of printers using IPP Everywhere protocol
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
