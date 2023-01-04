{ config, pkgs, ... }:
{
    imports = [
        ../../amod
        ../../modules/bspwm
        ../../modules/hyprland
        ../../modules/eww
        ../../modules/firefox
        ../../modules/alacritty
        ../../modules/neovim
    ];
}
