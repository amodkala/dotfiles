{ pkgs, lib, ... }:
{
    programs.eww = {
        enable = true;
        configDir = ./config;
    };
}
