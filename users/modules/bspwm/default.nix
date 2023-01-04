{ pkgs, lib, ... }:
{
    home.file.".xinitrc".text = ''
        sxhkd &
        exec bspwm
    '';

    services.sxhkd = {
        enable = true;
        keybindings = import ./sxhkd.nix;
    };

    xsession.windowManager.bspwm = {
        enable = true;
        settings = import ./bspwm.nix;
    };
}
