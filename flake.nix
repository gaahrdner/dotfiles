{
  description = "My system configuration";

  inputs.nixpkgs= {
    url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  inputs.brew-nix = {
    url = "github:BatteredBunny/brew-nix";
    inputs.brew-api.follows = "brew-api";
  };

  inputs.brew-api = {
    url = "github:BatteredBunny/brew-api";
    flake = false;
  };

  inputs.nix-darwin = {
    url = "github:LnL7/nix-darwin";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  
  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, brew-nix, brew-api, nix-darwin, home-manager, ... }: {
    homeConfigurations = {
      "gaahrdner@maxbeep" = home-manager.lib.homeManagerConfiguration ({
        modules = [ (import ./home.nix) ];
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
        };
      });
    };
  };
}
