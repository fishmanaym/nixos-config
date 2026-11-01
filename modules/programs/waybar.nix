{...}: {
  flake.nixosModules.waybar = {pkgs, ...}: {
    programs.waybar.enable = true;

    systemd.user.services.waybar.path = [
      pkgs.brightnessctl
    ];

    fonts.packages = with pkgs; [
      font-awesome
    ];
  };
}
