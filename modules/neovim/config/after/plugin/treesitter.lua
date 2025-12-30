require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    -- Disable Haskell due to broken query in nvim-treesitter (line 125)
    -- Can be removed when upstream fixes the impossible alternation pattern
    disable = { "haskell" },
  },
  indent = {
    enable = true,
  },
})
