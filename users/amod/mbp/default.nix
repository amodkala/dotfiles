{ config, pkgs, ... }:
{
    home = {
        stateVersion = "24.11";
        packages = with pkgs; [
		git
        ];
    };
    programs = with pkgs; {
	    home-manager.enable = true;

	    git = {
		    enable = true;
		    userName = "amod-vb";
		    userEmail = "amod.kala@vitalbio.com";
	    };
    };

    imports = [
        ../../modules/neovim
        ../../modules/tmux
    ];
}
