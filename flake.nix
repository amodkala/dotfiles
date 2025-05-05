{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      darwin,
      neovim-nightly-overlay,
      catppuccin,
      ...
    }:
    let
      overlays = [
        neovim-nightly-overlay.overlays.default
      ];
    in
    {
      darwinConfigurations = {
        "Amods-MBP" = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [
            ./hosts/macbook-pro
            home-manager.darwinModules.home-manager
            {
              nixpkgs.overlays = overlays;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.amodkala.imports = [
                  ./users/amod/macbook-pro
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
            }
          ];
        };
      };
    };
}
