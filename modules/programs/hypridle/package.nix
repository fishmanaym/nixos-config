{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: let
    defaultDeps = {
      inherit (pkgs) swaylock brightnessctl procps;
      mango = self'.packages.mango;
    };
    wrapPackage = {
      pkgs,
      package,
      deps ? {},
      flags,
    }:
      inputs.wrappers.lib.wrapPackage {
        inherit pkgs package flags;

        runtimePkgs = builtins.attrValues (defaultDeps // deps);

        filesToPatch = [
          "share/systemd/user/hypridle.service"
        ];
      };
  in {
    packages.hypridle = lib.makeOverridable wrapPackage {
      inherit pkgs;
      package = pkgs.hypridle;
      flags = {
        "-c" = ./config/hypridle.conf;
      };
    };
  };
}
