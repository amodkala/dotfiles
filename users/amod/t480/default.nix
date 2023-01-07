{ config, pkgs, ... }:
{
    imports = [
        ../../amod
        ../../modules/fonts
        ../../modules/bspwm
        ../../modules/eww
        ../../modules/rofi
        ../../modules/alacritty
        ../../modules/neovim
    ];
}
