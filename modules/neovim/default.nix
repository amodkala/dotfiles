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
          bash
          go
          haskell
          lua
          nix
          python
          rust
          wgsl

          json
          markdown
          terraform
          yaml
        ]
      ))
    ];

    extraPackages = [
      # telescope
      pkgs.ripgrep

      # lua
      pkgs.lua-language-server

      # nix
      pkgs.nixd
      pkgs.nixfmt-rfc-style
    ];
  };
}
