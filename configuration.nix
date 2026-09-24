# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };

    hostName = "atlas";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brightnessctl
    fuzzel # tofi?
    wl-clipboard
    grim
    slurp
    keepassxc
    mako # tiramisu ?
    fluffychat
    wlsunset
    nixd
    alejandra
    swaylock
    libqalculate
    prismlauncher
    ungoogled-chromium
    wbg
    wget
    zed-editor
    yazi # lf / lfcd / fff
    # wine
    adwaita-icon-theme
    python3
    zip
    unzip
    devenv
    jetbrains.idea

    jdk
    maven
    ghc
    haskell-language-server

    android-studio
  ];
  nixpkgs.config.android_sdk.accept_license = true;

  fonts.packages = with pkgs; [
    font-awesome
  ];

  security.pam.services.swaylock = {}; # needed or else will not get password

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  services.hypridle.enable = true;
  systemd.user.services.hypridle.path = [
    pkgs.swaylock
    pkgs.brightnessctl
    config.programs.mango.package
  ];

  # programs.noisetorch.enable = true; ?? if i ever need noise supression maybe
  programs.mango = {
    enable = true;
    addLoginEntry = false;
  };

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings.screencast = {
        chooser_type = "simple";
        chooser_cmd = "''${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
      };
    };
  };

  programs.vim.enable = true;
  programs.neovim.enable = true;
  programs.foot.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.waybar.enable = true;
  programs.obs-studio.enable = true;
  programs.steam.enable = true;

  systemd.user.services.waybar.path = [
    pkgs.brightnessctl
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    MOZ_ENABLE_WAYLAND = 1;
  };

  security.polkit.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  system.stateVersion = "26.05"; # do not change
}
