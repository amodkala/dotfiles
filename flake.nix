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
        {
          nixpkgs = {
            overlays = [
              inputs.neovim-nightly-overlay.overlays.default
            ];
            config.allowUnfree = true;
          };
          # Required for nix-darwin to work
          system.stateVersion = 1;

          users.users.amod = {
            name = "amod";
            home = "/Users/amod";
          };

          programs.zsh.enable = true;
        }
      ]
      ++ determinateDarwinModules
      ++ homeManagerDarwinModules;

      determinateDarwinModules = [
        {
          # Let Determinate Nix handle your Nix configuration
          nix.enable = false;

          # Custom Determinate Nix settings written to /etc/nix/nix.custom.conf
          determinate-nix.customSettings = {
            # Enables parallel evaluation (remove this setting or set the value to 1 to disable)
            eval-cores = 0;
            extra-experimental-features = [
              "build-time-fetch-tree" # Enables build-time flake inputs
              "parallel-eval" # Enables parallel evaluation
            ];
          };
        }
        inputs.determinate.darwinModules.default
      ];

      homeManagerDarwinModules = [
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.amod = {
              imports = [
                inputs.catppuccin.homeModules.catppuccin
                ./modules/neovim
                ./modules/claude
                ./modules/tmux.nix
                ./modules/catppuccin.nix
                ./modules/opencode.nix
                ./modules/ghostty.nix
                ./modules/zsh.nix
              ];
              programs = {
                home-manager.enable = true;

                git = {
                  enable = true;
                  settings.user = {
                    name = "amodkala";
                    email = "amodkala@gmail.com";
                  };
                };
              };
              home.stateVersion = "25.11";
            };
          };

        }
        inputs.home-manager.darwinModules.home-manager
      ];
    in
    {
      # nix-darwin configuration output
      darwinConfigurations.mac = inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit inputs;
        };
        modules = darwinModules;
      };
    };
}
