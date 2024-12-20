{ pkgs, lib, ... }:
{
    home = {
        username = "amod";
        homeDirectory = "/home/amod";
        stateVersion = "24.11";
    };

    programs = with pkgs; {
        home-manager.enable = true;

        git = {
            enable = true;
            userName = "amod-vb";
            userEmail = "amod.kala@vitalbio.com";
        };
    };
}
