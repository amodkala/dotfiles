{ pkgs, lib, ... }:
{

    xdg = {
        configFile.nvim = {
            source = ./config;
            recursive = true;
        };
    };

    programs.neovim = {
        enable = true;

        vimAlias = true;
        viAlias = true;

        plugins = with pkgs.vimPlugins; [
            plenary-nvim
            telescope-nvim	
            nvim-treesitter.withAllGrammars
        ];

        extraPackages = with pkgs; [
            ripgrep
        ];

        extraConfig = ''
            :luafile ~/.config/nvim/lua/init.lua
        '';
    };
}
