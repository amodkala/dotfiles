{ config, pkgs, ... }:
{
    imports = [
        ../../amod
        ../../modules/bspwm
        ../../modules/dwm
        ../../modules/hyprland
        ../../modules/firefox
        ../../modules/alacritty
        ../../modules/neovim
    ];
}
