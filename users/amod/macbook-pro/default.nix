{ config, pkgs, ... }:
{
	home.stateVersion = "22.11";

    	imports = [
		../../modules/neovim
	];
}
