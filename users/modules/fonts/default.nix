{pkgs, lib, ...}:
{
    home.packages = with pkgs; [
        (nerdfonts.override {
            fonts = [
                "FiraCode"
            ];
        })
    ];

    fonts.fontconfig.enable = true;
}
