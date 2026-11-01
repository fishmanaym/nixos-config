{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.mango = {pkgs, ...}: {
    imports = with self.nixosModules; [
      hypridle
      swaylock
      waybar
      inputs.mangowm.nixosModules.mango
    ];

    programs.mango = {
      enable = true;
      addLoginEntry = false;
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
  };
}
