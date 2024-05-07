{ pkgs, lib, ... }:
{
    home = {
        username = "amod";
        homeDirectory = "/home/amod";
        stateVersion = "23.05";
    };

    programs = with pkgs; {
        home-manager.enable = true;

        firefox.enable = true;

        git = {
            enable = true;
            userName = "amodkala";
            userEmail = "amodkala@gmail.com";
        };
    };
}
