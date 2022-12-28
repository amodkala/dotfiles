{ config, pkgs, ... }:
{

    imports = [
        ../../modules/hyprland
        ../../modules/neovim
    ];

    home = {
        username = "amod";
        homeDirectory = "/home/amod";
        stateVersion = "22.11";
    };

    programs = {
        home-manager.enable = true;
        firefox.enable = true;

        git = {
            enable = true;
            userName = "amodkala";
            userEmail = "amodkala@gmail.com";
        };
    };
}
