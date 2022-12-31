{ config, pkgs, ... }:
{

    imports = [
        ../../amod
        ../../modules/dwm
        ../../modules/alacritty
        ../../modules/neovim
    ];
}
