{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, agenix, ... }:
  let
    mkDarwinSystem = { profile, system ? "aarch64-darwin" }:
      nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          ./darwin/common.nix
          ./darwin/${profile}.nix
          home-manager.darwinModules.home-manager
          agenix.darwinModules.default
          {
            nixpkgs.config.allowUnfree = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pgardner = import ./home/profiles/${profile}.nix;
            home-manager.extraSpecialArgs = { inherit agenix; };
          }
        ];
      };
  in {
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;

    darwinConfigurations = {
      "swordfish" = mkDarwinSystem { profile = "work"; };
      "maxbeep"   = mkDarwinSystem { profile = "personal"; };
    };
  };
}
