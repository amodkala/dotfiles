{ config, pkg, lib, ...}:
let
    flake-compat = builtins.fetchTarball {
        url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
        sha256 = "0xcr9fibnapa12ywzcnlf54wrmbqqb96fmmv8043zhsycws7bpqy";
    };

    hyprland = (import flake-compat {
        src = builtins.fetchTarball {
            url = "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
            sha256 = "03liw72bzw6vds6b9b9lcfq4zrwvimz1j4zpa1a36snmybw3fkhg";
        };
    }).defaultNix;

in {
    imports = [
        hyprland.homeManagerModules.default
    ]; 

    xdg.configFile."hypr" = {
        source = ./config;
        recursive = true;
    };

    wayland.windowManager.hyprland.enable = true;
}

