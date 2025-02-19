{ config, pkgs, ... }:
{
    home = {
        username = "amod";
        homeDirectory = "/home/amod";
        stateVersion = "24.11";
    };

    programs = {
        home-manager.enable = true;

        git = {
            enable = true;
            userName = "amod-vb";
            userEmail = "amod.kala@vitalbio.com";
        };
    };

    imports = [
      ../../modules/catppuccin
      ../../modules/neovim
      ../../modules/tmux
    ];
}
