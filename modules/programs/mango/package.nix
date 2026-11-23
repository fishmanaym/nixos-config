{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    inputs',
    ...
  }: let
    defaultDeps = {
      inherit
        (pkgs)
        wbg
        wlsunset
        wl-clipboard
        grim
        slurp
        wireplumber
        brightnessctl
        playerctl
        ;
    };

    wrapPackage = {
      pkgs,
      package,
      env,
      deps ? {},
      flags,
    }:
      inputs.wrappers.lib.wrapPackage {
        inherit pkgs package env flags;
        runtimePkgs = builtins.attrValues (defaultDeps // deps);
      };
  in {
    packages.mango = lib.makeOverridable wrapPackage {
      inherit pkgs;
      package = inputs'.mango.packages.mango;

      env = {
        WALLPAPER = "${./config}/wallpaper.jpg";
        TERMINAL = "${pkgs.foot}/bin/foot";
        BROWSER = "${pkgs.firefox}/bin/firefox";
        LAUNCHER = "${pkgs.fuzzel}/bin/fuzzel";
      };

      flags = {
        "-c" = "${./config}/config.conf";
      };
    };
  };
}
