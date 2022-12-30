{
    description = "NixOS configs";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixos-hardware, home-manager }:
    let
        system = "x84_64-linux";
    in {
        nixosConfigurations = {
            t430s = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/t430s
                    nixos-hardware.nixosModules.lenovo-thinkpad-t430
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

            t480 = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/t480
                    nixos-hardware.nixosModules.lenovo-thinkpad-t480
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.amod = import ./users/amod/t480;
                        };
                    }
                ];
            };

        };
    };
}
