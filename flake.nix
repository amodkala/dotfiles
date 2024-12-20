{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            modules = [
                ./hosts/nixos-vm
                home-manager.nixosModules.home-manager
                { home-manager.users.amod = import ./users/amod/nixos-vm; }
            ];
        };
    };
} 
