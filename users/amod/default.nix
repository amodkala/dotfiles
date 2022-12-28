{ pkgs, lib, ... }:
{
    home = {
        username = "amod";
        homeDirectory = "/home/amod";
        stateVersion = "22.11";
    };

    programs = with pkgs; {
        home-manager.enable = true;

        git = {
            enable = true;
            userName = "amodkala";
            userEmail = "amodkala@gmail.com";
        };
    };
}
