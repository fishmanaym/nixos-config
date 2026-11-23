{moduleWithSystem, ...}: {
  flake.nixosModules.waybar = moduleWithSystem ({self', ...}: {
    systemd = {
      packages = [self'.packages.waybar];
      user.services.waybar.wantedBy = ["graphical-session.target"];
    };
  });
}
