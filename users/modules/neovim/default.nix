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

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = [
      pkgs.ripgrep
      pkgs.gcc

      pkgs.lazygit

      pkgs.rust-analyzer
      pkgs.cargo
      pkgs.rustc

      pkgs.nixd
      pkgs.nixfmt-rfc-style

      pkgs.ghc
      pkgs.haskell-language-server
      pkgs.cabal-install
    ];
  };
}
