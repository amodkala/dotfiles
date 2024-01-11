{ pkgs, lib, ... }:
{
    programs.tmux = {
        enable = true;
        keyMode = "vi";
        shortcut = "a";
        extraConfig = ''
            set -ag terminal-overrides "$TERM:RGB"
        '';
    };
}
