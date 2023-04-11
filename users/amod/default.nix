{ pkgs, lib, ... }:
{
    home = {
        username = "amodkala";
        homeDirectory = "/home/amodkala";
        stateVersion = "22.11";
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
