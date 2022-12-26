{ config, pkgs, ... }:
{
    home = {
        username = "amod";
        homeDirectory = "/home/amod";
        packages = with pkgs; [
            wl-clipboard
        ];
        stateVersion = "22.11";
    };

    xdg = {
        configFile.nvim = {
            source = ../../modules/neovim;
            recursive = true;
        };
        configFile.hypr = {
            source = ../../modules/hyprland;
            recursive = true;
        };
    };

    wayland.windowManager.hyprland = import ../../modules/hyprland { inherit pkgs; };

    programs = {
        home-manager.enable = true;
        alacritty.enable = true;
        firefox.enable = true;

        neovim = import ../../modules/neovim { inherit pkgs; }; 

        git = {
            enable = true;
            userName = "amodkala";
            userEmail = "amodkala@gmail.com";
        };
    };
}
