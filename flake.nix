{
  description = "A flake template for nix-darwin and Determinate Nix";

  # Flake inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:amodkala/catppuccin-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake outputs
  outputs =
    { self, ... }@inputs:
    let
      darwinModules = [
        ./modules/darwin.nix
        {
          nixpkgs.overlays = [
            inputs.neovim-nightly-overlay.overlays.default
          ];
        }
      ];

      determinateDarwinModules = [
        ./modules/determinate.nix
        inputs.determinate.darwinModules.default
      ];

      homeManagerDarwinModules = [
        ./modules/home-manager.nix
        {
          home-manager.users.amod.imports = [ inputs.catppuccin.homeModules.catppuccin ];
        }
        inputs.home-manager.darwinModules.home-manager
      ];
    in
    {
      # nix-darwin configuration output
      darwinConfigurations.mac = inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = darwinModules ++ determinateDarwinModules ++ homeManagerDarwinModules;
      };
    };
}
