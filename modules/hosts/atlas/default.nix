{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.atlas = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      atlas
      broken-kb

      fish

      system
    ];
  };

  flake.nixosModules.atlas = {pkgs, ...}: {
    imports = [
      # _ because import-tree doesn't see it if it starts with _
      ./_hardware-configuration.nix
    ];

    networking.hostName = "atlas";
    networking.firewall = {
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      (import inputs.creamlinux-installer {inherit pkgs;})
      # brightnessctl
      fuzzel # tofi?
      keepassxc
      mako # tiramisu ?
      fluffychat
      nixd
      alejandra
      libqalculate
      prismlauncher
      ungoogled-chromium
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

      jdk25
      maven
      ghc
      haskell-language-server
      nodejs

      android-studio
    ];
    nixpkgs.config.android_sdk.accept_license = true;

    environment.sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };

    # programs.noisetorch.enable = true; ?? if i ever need noise supression maybe
    programs.vim.enable = true;
    programs.neovim.enable = true;
    programs.foot.enable = true;
    programs.git.enable = true;
    programs.firefox.enable = true;
    programs.obs-studio.enable = true;
    programs.steam = {
      enable = true;
      extraPackages = with pkgs; [
        adwaita-icon-theme
      ];
    };

    security.polkit.enable = true;

    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
    };

    services.tailscale.enable = true;

    # zstd compression
    fileSystems = {
      "/".options = ["compress=zstd"];
      "/home".options = ["compress=zstd"];
      "/nix".options = ["compress=zstd" "noatime"];
      # "/swap".options = ["noatime"];
    };

    system.stateVersion = "26.05"; # do not change
  };
}
