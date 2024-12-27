{pkgs, lib, ...}:
{
    home.packages = with pkgs; [
    	nerd-fonts.fira-code
    ];

    fonts.fontconfig.enable = true;
}
