let
    desktops = [
        "I"
        "II"
        "III"
        "IV"
        "V"
        "VI"
        "VII"
        "VIII"
        "IX"
        "X"
    ];
in {
    enable = true;

    monitors = {
        eDP-1 = desktops; # T480 built-in display
        LVDS-1 = desktops; # T430s built-in display
    };

    settings = {
        border_width = 2;
        window_gap = 10;
    };
}
