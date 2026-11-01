{self, ...}: {
  flake.nixosModules.uwsm = {...}: {
    imports = with self.nixosModules; [mango];

    programs.uwsm = {
      enable = true;
      waylandCompositors = {
        mango = {
          prettyName = "Mango";
          comment = "Mango compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/mango";
        };
      };
    };
  };
}
