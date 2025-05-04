{
    description = "NixOS configs";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        darwin = {
            url = "github:lnl7/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, darwin }: {
        darwinConfigurations = {
            "Amods-MBP" = darwin.lib.darwinSystem {
                system = "x86_64-darwin";
                modules = [
                    ./hosts/macbook-pro
                        home-manager.darwinModules.home-manager
                        { 
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.amodkala = import ./users/amod/macbook-pro;
                        }
                ];
            };
        };
    };
}
