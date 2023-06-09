{pkgs, lib, ...}:
let
    nvim-r = pkgs.vimUtils.buildVimPlugin {
        name = "nvim-r";
        src = pkgs.fetchFromGitHub {
            owner = "jalvesaq";
            repo = "Nvim-R";
            rev = "v0.9.17";
            sha256 = "0617whi2wl84p6bi12pj6dvkfdknkh3h2a6qxxx0s26j4kyzh6wy";
        };
        buildInputs = with pkgs; [
            which
            vim
            zip
        ];
    };
in {
    programs.neovim.plugins = with pkgs.vimPlugins; [ 
        # custom
        nvim-r

        # editor tools
        plenary-nvim
        telescope-nvim	
        vimtex

        # themes
        catppuccin-nvim

        # language tools
        nvim-treesitter.withAllGrammars
        nvim-lspconfig
        rust-tools-nvim
    ];
}
