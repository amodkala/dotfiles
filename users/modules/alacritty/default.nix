{ pkgs, lib, ... }:
{
    programs.alacritty = {
        enable = true;
        settings = import ./alacritty.nix;
    };
}
