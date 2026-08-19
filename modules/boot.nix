_:

{
  boot = {  
    loader = {  # TODO: configure
      grub = { 
        enable = true;
        device = "/dev/sda";  # probably needs to change it when installing or smth, works on vm
      };
    };

    # zswap.enable = true;

    tmp = {
      # tmpfs = true; # test before enabling, low on ram can be problematic for compiling
      boot.tmp.cleanOnBoot = true; # disable when tmpfs = true;
    }
  };
}