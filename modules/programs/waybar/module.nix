{moduleWithSystem, ...}: {
  flake.nixosModules.waybar = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {
    fonts.packages = with pkgs; [
      font-awesome
    ];

    systemd = {
      packages = [self'.packages.waybar];
      user.services.waybar.wantedBy = ["graphical-session.target"];
    };
  });
}
