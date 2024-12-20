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

        extraPackages = with pkgs; [
            ripgrep
            gcc

            rust-analyzer
            cargo
            rustc

            nixd

            ghc
            haskell-language-server
            cabal-install
        ];

        extraConfig = ''
            :luafile ~/.config/nvim/lua/init.lua
        '';
    };
}
