{ pkgs, lib, ... }:
{
    imports = [
        ./plugins.nix
    ];

    xdg = {
        configFile.nvim = {
            source = ./config;
            recursive = true;
        };
    };

    programs.neovim = {
        enable = true;
#        package = pkgs.neovim-nightly;

        vimAlias = true;
        viAlias = true;

        extraPackages = with pkgs; [
            ripgrep
        ];

        extraConfig = ''
            :luafile ~/.config/nvim/lua/init.lua
        '';
    };
}
