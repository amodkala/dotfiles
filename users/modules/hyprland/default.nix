{ pkgs }:
{

    home.packages = with pkgs; [
        wl-clipboard
    ];

    xdg.configFile.hypr = {
        source = .;
        recursive = true;
    };

    wayland.windowManager.hyprland.enable = true;
}
