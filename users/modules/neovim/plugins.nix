{ pkgs, lib, ... }:
{
  programs.neovim.plugins = [
    # editor tools
    pkgs.vimPlugins.plenary-nvim
    pkgs.vimPlugins.telescope-nvim
    pkgs.vimPlugins.lazygit-nvim

    # language tools
    pkgs.vimPlugins.nvim-lspconfig
    (pkgs.vimPlugins.nvim-treesitter.withPlugins (
      p: with p; [
        haskell
        rust
        nix
        bash
        markdown
        yaml
        json
        terraform
      ]
    ))
  ];
}
