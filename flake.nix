{
  description = "nix-darwin and NixOS configurations";

  # Flake inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
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
    vital-nix.url = "git+ssh://git@github.com/VitalBio/vital-nix?ref=amod/developer-module";
  };

  # Flake outputs
  outputs =
    { self, ... }@inputs:
    let
      # Darwin modules
      darwinModules = [
        ./modules/darwin.nix
        {
          nixpkgs.overlays = [
            inputs.neovim-nightly-overlay.overlays.default
          ];
        }
      ];

      vitalDarwinModules = [
        inputs.vital-nix.darwinModules.developer
        {
          vital.developer = {
            enable = true;
            nixbuild.sshKey = "/Users/amodkala/.ssh/id_nixbuild";
          };
        }
      ];

      homeManagerDarwinModules = [
        ./modules/home-manager-darwin.nix
        {
          home-manager.users.amodkala.imports = [ inputs.catppuccin.homeModules.catppuccin ];
        }
        inputs.home-manager.darwinModules.home-manager
      ];

      # NixOS modules
      nixosModules = [
        {
          nixpkgs.overlays = [
            inputs.neovim-nightly-overlay.overlays.default
          ];
        }
      ];

      vitalNixosModules = [
        inputs.vital-nix.nixosModules.developer
        {
          vital.developer = {
            enable = true;
            nixbuild.sshKey = "/home/amod/.ssh/id_nixbuild";
          };
        }
      ];

      homeManagerNixosModules = [
        ./modules/home-manager-vm.nix
        {
          home-manager.users.amod.imports = [ inputs.catppuccin.homeModules.catppuccin ];
        }
        inputs.home-manager.nixosModules.home-manager
      ];
    in
    {
      # NixOS VM configurations
      nixosConfigurations = {
        vm = inputs.nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [ ./modules/nixos ] ++ nixosModules ++ homeManagerNixosModules ++ vitalNixosModules;
        };
      }
      // inputs.nixpkgs.lib.optionalAttrs (builtins.pathExists ./hosts/orb/configuration.nix) {
        orb = inputs.nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ./hosts/orb/configuration.nix
            inputs.vital-nix.nixosModules.orbstack
            ./modules/nixos/common.nix
          ]
          ++ nixosModules
          ++ homeManagerNixosModules
          ++ vitalNixosModules;
        };
      };

      # nix-darwin configuration
      darwinConfigurations.mac = inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules =
          darwinModules ++ homeManagerDarwinModules ++ vitalDarwinModules;
      };
    };
}
