{
  description = "Fishmanaym's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    creamlinux-installer = {
      type = "github";
      owner = "Novattz";
      repo = "creamlinux-installer";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    #nixosModules = import ./modules/nixos;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#atlas'
    nixosConfigurations = {
      # hostname = ...
      atlas = nixpkgs.lib.nixosSystem {
        specialArgs = {
          myLib = import ./myLib {lib = nixpkgs.lib;};
          inherit inputs;
        };
        modules = [
          inputs.hjem.nixosModules.default
          inputs.mangowm.nixosModules.mango
          inputs.xremap.nixosModules.default
          ./configuration.nix
        ];
      };
    };
  };
}
