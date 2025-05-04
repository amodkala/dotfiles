{ config, pkgs, ... }:
{
    home = {
        stateVersion = "23.05";
        packages = with pkgs; [
            rustc
            cargo
            go
        ];
    };

    imports = [
        ../../modules/neovim
        ../../modules/tmux
    ];
}
