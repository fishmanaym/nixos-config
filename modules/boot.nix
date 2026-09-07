{ config, ... }:

{
  boot = {  
    loader = {  # TODO: configure
      grub = { 
        enable = false;
        device = "/dev/sda";  # probably needs to change it when installing or smth, works on vm
        fsIdentifier = "provided"; # use provided UUIDs instead of blkid probing (required for btrfs subvolumes)
      };

      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # zswap.enable = true;

    tmp = rec {
      useTmpfs = true; 
      cleanOnBoot = !useTmpfs;
    };
  };
  
  # if tmpfs make nixos use /var/tmp to prevent running out of space
#  systemd.services.nix-daemon = 
#    if config.boot.tmp.useTmpfs then { environment.TMPDIR = "/var/tmp"; } else { };
}
