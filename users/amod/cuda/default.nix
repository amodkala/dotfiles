{ config, pkgs, ... }:
{
    imports = [
        ../../amod
	../../modules/alacritty
        ../../modules/bspwm
        ../../modules/fonts
	../../modules/neovim
        ../../modules/tmux
    ];
}
