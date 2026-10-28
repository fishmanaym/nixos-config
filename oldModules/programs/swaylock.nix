{pkgs, ...}: {
  environment.systemPackages = [pkgs.swaylock];
  security.pam.services.swaylock = {}; # needed or else will not get password
}
