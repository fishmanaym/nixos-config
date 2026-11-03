{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    getBrightnessSh = pkgs.writeShellScriptBin "getbrightness.sh" (builtins.readFile ./config/scripts/getbrightness.sh);

    fontsConf = font:
      pkgs.makeFontsConf {
        fontDirectories = [font];
      };

    wrapPackage = {
      pkgs,
      package,
      deps,
    }:
      inputs.wrappers.lib.wrapPackage {
        inherit pkgs package;
        flags = {
          "-c" = ./config/config.jsonc;
          "-s" = ./config/style.css;
        };

        runtimePkgs = [
          deps.brightnessctl
          deps.wireplumber
          deps.font-awesome
          getBrightnessSh
        ];

        filesToPatch = [
          "share/systemd/user/waybar.service"
        ];

        # env = "${(fontsConf )}";
      };
  in {
    packages.waybar = lib.makeOverridable wrapPackage {
      inherit pkgs;
      package = pkgs.waybar;
      deps = {
        inherit
          (pkgs)
          brightnessctl
          wireplumber
          font-awesome
          ;
      };
    };
  };
}
