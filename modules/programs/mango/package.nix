{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    inputs',
    ...
  }: let
    wrapPackage = {
      pkgs,
      package,
      env,
      deps,
    }:
      inputs.wrappers.lib.wrapPackage {
        inherit pkgs package env;

        flags = {
          "-c" = "${./config}/config.conf";
        };

        runtimePkgs = [
          deps.wbg
          deps.wlsunset

          deps.wl-clipboard
          deps.grim
          deps.slurp
          deps.wireplumber
          deps.brightnessctl
          deps.playerctl
        ];
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

      deps = {
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
    };
  };
}
