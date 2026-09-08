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
        # specialArgs = {inherit inputs;};
        modules = [
          inputs.hjem.nixosModules.default
          inputs.mangowm.nixosModules.mango
          ./configuration.nix
        ];
      };
    };
  };
}
