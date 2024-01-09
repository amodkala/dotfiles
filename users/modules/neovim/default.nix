{ pkgs, lib, ... }:
let
    tex = (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-medium
        tcolorbox enumitem;
    });
in
{
    imports = [
        ./plugins.nix
    ];

    home.packages = with pkgs; [
        rust-analyzer
        gopls
        tex
    ];

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

        extraPackages = with pkgs; [
            ripgrep
        ];

        extraConfig = ''
            :luafile ~/.config/nvim/lua/init.lua
        '';
    };
}
