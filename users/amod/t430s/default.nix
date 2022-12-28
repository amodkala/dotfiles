{ config, pkgs, ... }:
{
    imports = [
        ../../modules/dwm
        ../../modules/neovim
    ];

    home = {
        username = "amod";
        homeDirectory = "/home/amod";
        stateVersion = "22.11";
    };

    programs = with pkgs; {
        git = {
            enable = true;
            userName = "amodkala";
            userEmail = "amodkala@gmail.com";
        };
    };
}
