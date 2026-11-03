{
  self,
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.mango = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {
    imports = with self.nixosModules; [
      hypridle
      waybar
      inputs.mango.nixosModules.mango
    ];

    programs.mango = {
      enable = true;
      addLoginEntry = false;
      package = self'.packages.mango;
    };

    xdg.portal = {
      enable = true;
      wlr = {
        enable = true;
        settings.screencast = {
          chooser_type = "simple";
          chooser_cmd = "''${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
        };
      };
    };
  });
}
