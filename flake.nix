{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, catppuccin, ... }@inputs: {
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/vm
        home-manager.nixosModules.home-manager
        { 
          home-manager.users.amod = {
            imports = [
              ./users/amod/vm
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
      ];
    };
    darwinConfigurations.mbp = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/mbp 
        home-manager.darwinModules.home-manager
        { 
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.amodkala = {
            imports = [
              ./users/amod/mbp
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
      ];
    };
  };
} 
