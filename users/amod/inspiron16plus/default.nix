{ config, pkgs, ... }:
{
    imports = [
        ../../amod
        ../../modules/fonts
        ../../modules/bspwm
        ../../modules/fish
        ../../modules/alacritty
        ../../modules/neovim
    ];
}
