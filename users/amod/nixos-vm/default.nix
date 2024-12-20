{ config, pkgs, ... }:
{
    home.stateVersion = "24.11";

    imports = [
        ../../amod
        ../../modules/neovim
        ../../modules/tmux
    ];
}
