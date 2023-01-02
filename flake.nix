{
    description = "NixOS configs";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "github:HyprWM/Hyprland";
    };

    outputs = { self, nixpkgs, nixos-hardware, home-manager, hyprland }:
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
                    { home-manager.users.amod = import ./users/amod/t430s; }
                ];
            };

            t480 = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/t480
                    home-manager.nixosModules.home-manager
                    { home-manager.users.amod = import ./users/amod/t480; }
                    hyprland.nixosModules.default
                    { programs.hyprland.enable = true; }
                ];
            };

        };
    };
}
