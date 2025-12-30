return {
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  filetypes = { "haskell", "lhaskell" },
  root_markers = {
    ".git",
    "cabal.project",
    "*.cabal",
    "package.yaml",
    "hie.yaml",
  },
  settings = {
    haskell = {
      formattingProvider = "fourmolu",
      checkProject = true,
      plugin = {
        -- Core features
        hlint = {
          globalOn = true,
          diagnosticsOn = true,
          codeActionsOn = true,
        },
        -- Import management
        importLens = {
          globalOn = true,
          codeActionsOn = true,
        },
        -- Type information
        class = { globalOn = true },
        eval = { globalOn = true },  -- Evaluate code in comments
        -- Refactoring tools
        refineImports = {
          globalOn = true,
          codeActionsOn = true,
        },
        retrie = { globalOn = true },
        tactics = { globalOn = true },  -- Wingman for auto-filling holes
        -- Code lenses
        moduleName = { globalOn = true },
      },
    },
  },
}
