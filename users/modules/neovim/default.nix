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
        defaultEditor = true;

        vimAlias = true;
        viAlias = true;

        extraPackages = [
            pkgs.ripgrep
            pkgs.gcc

            pkgs.rust-analyzer
            pkgs.cargo
            pkgs.rustc

            pkgs.nixd

            pkgs.ghc
            pkgs.haskell-language-server
            pkgs.cabal-install
        ];

        extraConfig = ''
            :luafile ~/.config/nvim/lua/init.lua
        '';
    };
}
