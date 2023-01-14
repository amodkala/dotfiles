{ config, pkgs, ... }:
{
    imports = [
        ../../amod
        ../../modules/fonts
        ../../modules/bspwm
        ../../modules/fish
        ../../modules/eww
        ../../modules/alacritty
        ../../modules/neovim
        ../../modules/zathura
    ];
}
