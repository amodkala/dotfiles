{ config, pkgs, ... }:
{

    imports = [
        ../../amod
        ../../modules/hyprland
        ../../modules/alacritty
        ../../modules/neovim
    ];
}
