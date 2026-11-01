{...}: {
  flake.nixosModules.hypridle = {
    pkgs,
    config,
    ...
  }: let
    pkg = pkgs.hypridle;
  in {
    environment.systemPackages = [pkg];
    systemd = {
      packages = [pkg];
      user.services.hypridle = {
        wantedBy = ["graphical-session.target"];
        path = [
          pkgs.swaylock
          pkgs.brightnessctl
          config.programs.mango.package
          pkgs.procps
        ];
      };
    };
  };
}
