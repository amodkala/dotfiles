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
    defaultEditor = true;
    package = pkgs.neovim;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = [
      # editor tools
      pkgs.vimPlugins.plenary-nvim
      pkgs.vimPlugins.telescope-nvim

      # language tools
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (
        p: with p; [
          rust
          nix
          lua
          bash
          python
          markdown
          yaml
          json
          terraform
        ]
      ))
    ];

    extraPackages = [
      pkgs.ripgrep

      # lua
      pkgs.lua-language-server

      # rust
      pkgs.rust-analyzer
      pkgs.clippy
      pkgs.rustfmt

      # nix
      pkgs.nixd
      pkgs.nixfmt-rfc-style

      # python
      pkgs.ruff
      pkgs.ty
    ];
  };
}
