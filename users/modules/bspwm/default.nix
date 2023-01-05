{ pkgs, lib, ... }:
{
    home.file.".xinitrc".text = ''
        picom &
        sxhkd &
        exec bspwm
    '';

    services.picom = {
        enable = true;
        inactiveOpacity = 0.8;
        vSync = true;
    };

    services.sxhkd = {
        enable = true;
        keybindings = import ./sxhkd.nix;
    };

    xsession.windowManager.bspwm = {
        enable = true;
        settings = import ./bspwm.nix;
    };
}
