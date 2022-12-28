{ pkgs, lib, ... }:
let
    nixpkgs.overlays = [
        (self: super: {
             dwm = super.dwm.overrideAttrs (oldAttrs: rec {

             });

             st = super.st.overrideAttrs (oldAttrs: rec {

             });
        })
    ];
in {

    home.file.".xinitrc".text = ''
        exec dwm
    '';

    home.packages = with pkgs; [
        dwm
        st
    ];
}
