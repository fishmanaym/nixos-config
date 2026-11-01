{self, ...}: {
  flake.nixosModules.networking = {...}: {
    imports = with self.nixosModules; [
      blocklist
      dnsovertls
      networkmanager
    ];
  };
}
