{pkgs, lib, ...}:
{
    programs.neovim.plugins = with pkgs.vimPlugins; [ 
        # editor tools
        plenary-nvim
        telescope-nvim	
        # vimtex
        # luasnip

        # themes
        catppuccin-nvim

        # language tools
        nvim-treesitter.withAllGrammars
        nvim-lspconfig
    ];
}
