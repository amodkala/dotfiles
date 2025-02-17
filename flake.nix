{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	nix-darwin = {
		url = "github:lnl7/nix-darwin/nix-darwin-24.11";
		inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = { self, nixpkgs, home-manager, nix-darwin, ... }@inputs: {
        nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            modules = [
                ./hosts/vm
                home-manager.nixosModules.home-manager
                { home-manager.users.amod = import ./users/amod/vm; }
            ];
        };
	darwinConfigurations.mbp = nix-darwin.lib.darwinSystem {
		system = "aarch64-darwin";
		modules = [
			./hosts/mbp
			home-manager.darwinModules.home-manager
			{ 
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.amodkala = import ./users/amod/mbp;
			}
		];
	};
    };
} 
