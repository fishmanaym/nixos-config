{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: let
    wrapPackage = {
      pkgs,
      package,
      deps,
    }:
      inputs.wrappers.lib.wrapPackage {
        inherit pkgs package;
        flags = {
          "-c" = ./config/hypridle.conf;
        };

        runtimePkgs = [
          deps.swaylock
          deps.brightnessctl
          deps.procps
          deps.mango
        ];

        filesToPatch = [
          "share/systemd/user/hypridle.service"
        ];
      };
  in {
    packages.hypridle = lib.makeOverridable wrapPackage {
      inherit pkgs;
      package = pkgs.hypridle;
      deps = {
        inherit (pkgs) swaylock brightnessctl procps;
        mango = self'.packages.mango;
      };
    };
  };
}
