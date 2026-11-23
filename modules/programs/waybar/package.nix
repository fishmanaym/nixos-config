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

    defaultDeps = {
      inherit
        (pkgs)
        brightnessctl
        wireplumber
        ;
      inherit getBrightnessSh;
    };

    wrapPackage = {
      pkgs,
      package,
      deps ? {},
      env,
      flags,
    }:
      inputs.wrappers.lib.wrapPackage {
        inherit pkgs package env flags;

        runtimePkgs = builtins.attrValues (defaultDeps // deps);

        filesToPatch = [
          "share/systemd/user/waybar.service"
        ];
      };
  in {
    packages.waybar = lib.makeOverridable wrapPackage {
      inherit pkgs;
      package = pkgs.waybar;
      env."FONTCONFIG_FILE" = "${fontsConf pkgs.font-awesome}";
      flags = {
        "-c" = ./config/config.jsonc;
        "-s" = ./config/style.css;
      };
    };
  };
}
