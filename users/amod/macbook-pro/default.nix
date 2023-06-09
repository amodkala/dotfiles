{ config, pkgs, ... }:
{
    home = {
        stateVersion = "22.11";
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
