{pkgs, lib, ...}:
{
    programs.neovim.plugins = with pkgs.vimPlugins; [ 
        # editor tools
        plenary-nvim
        telescope-nvim	
        # vimtex
        # luasnip

        # language tools
        (nvim-treesitter.withPlugins (p: with p; [ 
          haskell
          rust
          nix
          bash
          markdown
          yaml
          json
          terraform
        ]))
        nvim-lspconfig
    ];
}
