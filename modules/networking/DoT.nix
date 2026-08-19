_: # DNS over TLS using Quad9

{ 
  networking.networkmanager.dns = "systemd-resolved";

  networking.nameservers = [ "9.9.9.9#dns.quad9.net" # maybe 9.9.9.10 if it's filtering any site im actually using (read somewhere that catbox.moe has issues)
                             "149.112.112.112#dns.quad9.net" 
                             "2620:fe::fe#dns.quad9.net" 
                             "2620:fe::9#dns.quad9.net" ];

  services.resolved.enable = true;
  services.resolved.Resolve.DNSOverTLS = true;
  services.resolved.Resolve.Domains = "~.";
}