let
    mod = "alt";
in {
    enable = true;

    keybindings = {

        # quit/close
        "${mod} + shift + e" = "bspc quit";
        "${mod} + shift + q" = "bspc node -k";

        # toggle floating/tiled mode
        "${mod} + {t,f}" = "bspc node -t { tiled, floating }";

        # window movement within and between desktops
        "${mod} + {_, shift +}{1-9,0}" = "bspc {desktop -f, node -d} '^{1-9,10}'";
        "${mod} + {_, shift +}{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

        # move floating windows
        "super + {h,j,k,l}" = "bspc node -v {-20 0, 0 20, 0 -20, 20 0}";

        # resize window to the bottom + right
        "super + shift + {h,j,k,l}" = "bspc node -z {right -20 0, bottom 0 20, bottom 0 -20, right 20 0}";

        # system utilities
        "${mod} + Print" = "maim -Bu ~/Pictures/$(date +%s).png";
        "XF86MonBrightness{Up,Down}" = "light -{A,U} 1";

        # application-specific keybinds
        "${mod} + Return" = "alacritty";
        "${mod} + b" = "firefox";
    };
}
