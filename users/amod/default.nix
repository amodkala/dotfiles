{ pkgs, lib, ... }:
{
    home = {
        username = "amodkala";
        homeDirectory = "/Users/amodkala";
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
