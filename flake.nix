{
  description = "A flake template for nix-darwin and Determinate Nix";

  # Flake inputs
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    nix-darwin = {
      url = "https://flakehub.com/f/nix-darwin/nix-darwin/0.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
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
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake outputs
  outputs =
    { self, ... }@inputs:
    {
      # nix-darwin configuration output
      darwinConfigurations.mac = inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          inputs.determinate.darwinModules.default
          inputs.home-manager.darwinModules.home-manager
	  ./modules/darwin.nix
	  ./modules/determinate.nix
	  {
            nixpkgs.overlays = [
              inputs.neovim-nightly-overlay.overlays.default
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.amod = {
	        imports = [
                  inputs.catppuccin.homeModules.catppuccin
		  ./modules/home-manager.nix
                ];
	        home.stateVersion = "25.11";
              };
	    };
	  }
        ];
      };
    };
}
