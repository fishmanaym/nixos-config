{self, ...}: {
  flake.nixosModules.system = {...}: {
    imports = with self.nixosModules; [
      shells

      networking
      audio
      bluetooth
      boot
      graphics
      locale
      nix
      power-management
      printing
      uwsm
    ];
  };
}
