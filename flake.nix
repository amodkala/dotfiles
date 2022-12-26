{
    description = "NixOS configs";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager }:
    let
        system = "x84_64-linux";
    in {
        nixosConfigurations = {
            t430s = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/t430s
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.amod = import ./users/amod/t430s;
                        };
                    }
                ];
            };
        };
    };
}
