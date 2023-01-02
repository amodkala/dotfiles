{ config, pkgs, ... }:
{
    imports = [
        ../../amod
        ../../modules/dwm
        ../../modules/hyprland
        ../../modules/firefox
        ../../modules/alacritty
        ../../modules/neovim
    ];
}
