{moduleWithSystem, ...}: {
  flake.nixosModules.hypridle = moduleWithSystem ({self', ...}: {
    systemd = {
      packages = [self'.packages.hypridle];
      user.services.hypridle.wantedBy = ["graphical-session.target"];
    };

    security.pam.services.swaylock = {}; # needed or else swaylock will not get the password and get stuck
  });
}
