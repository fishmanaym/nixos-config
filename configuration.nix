# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
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

  # environment.loginShellInit = ''
  #   [ "$(tty)" = /dev/tty1 ] && exec mango
  # '';

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
    swayidle
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
  ];

  fonts.packages = with pkgs; [
    font-awesome
  ];

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  # programs.noisetorch.enable = true; ?? if i ever need noise supression maybe
  programs.mango.enable = true;
  programs.vim.enable = true;
  programs.neovim.enable = true;
  programs.foot.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.waybar.enable = true;
  programs.obs-studio.enable = true;
  programs.steam.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    MOZ_ENABLE_WAYLAND = 1;
  };

  security.polkit.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  system.stateVersion = "26.05"; # do not change
}
