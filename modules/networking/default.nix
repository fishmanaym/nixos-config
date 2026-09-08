{
  imports = [
    ./blocklist.nix
    #  ./networkmanager.nix
  ];
  networking.networkmanager.enable = true;
}
