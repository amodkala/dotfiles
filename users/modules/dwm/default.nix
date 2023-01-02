{ pkgs, lib, ... }:
let
    nixpkgs.overlays = [
        (self: super: {
            dwm = super.dwm.overrideAttrs (oldAttrs: rec {

            });
        })
    ];

    wallpaper = ./config/Vermeer-view-of-delft.jpg;
in {
    home.file.".xinitrc".text = ''
        feh --no-fehbg --bg-fill ${wallpaper}
        exec dwm
    '';

    home.packages = with pkgs; [
        dwm
        st
        dmenu
    ];

    programs.feh.enable = true;
}
