{...}: {
  flake.nixosModules.dnsovertls = {...}: {
    networking.networkmanager.dns = "systemd-resolved";

    networking.nameservers = [
      "9.9.9.10#dns.quad9.net"
      "149.112.112.10#dns.quad9.net"
      "2620:fe::10#dns.quad9.net"
      "2620:fe::fe:10#dns.quad9.net"
    ];

    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNSOverTLS = "opportunistic"; # can't be true or eduroam blocks dns
        Domains = "~.";
      };
    };
  };
}
