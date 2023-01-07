let
    mod = "alt";
in {
    enable = true;

    keybindings = {

        "${mod} + shift + e" = "bspc quit";
        "${mod} + shift + q" = "bspc node -k";

        "${mod} + {t,f}" = "bspc node -t { tiled, floating }";

        "${mod} + {_, shift +}{1-9,0}" = "bspc {desktop -f, node -d} '^{1-9,10}'";
        "${mod} + {_, shift +}{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

        "${mod} + Return" = "alacritty";
        "${mod} + b" = "firefox";
        "${mod} + Space" = "rofi -show drun";
    };
}
