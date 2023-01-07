{
    enable = true;

    settings = {

        corner-radius = 15;
        round-borders = 15;

        active-opacity = 1.0;
        inactive-opacity = 0.9;

        blur = {
            method = "dual_kawase";
            strength = 5;
            background = false;
            background-frame = false;
            background-fixed = false;
            kern = "3x3box";
        };

        experimental-backends = true;
        backend = "glx";
        glx-no-stencil = true;

        vsync = true;

        use-damage = true;

    };
}
