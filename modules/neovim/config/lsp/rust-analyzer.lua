return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = {
    ".git",
    "Cargo.toml",
    "Cargo.lock",
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      check = {
        command = "clippy",
        extraArgs = {
          "--",
          "--no-deps",
          "-Wclippy::perf",
          "-Aclippy::module_name_repetitions",
          "-Aclippy::missing_panics_doc",
          "-Aclippy::missing_errors_doc",
        },
      },
      checkOnSave = true,
      procMacro = {
        enable = true,
        ignored = {
          ["napi-derive"] = { "napi" },
          ["async-recursion"] = { "async_recursion" },
        },
      },
      diagnostics = { enable = true, },
      autoformat = true,
      inlayHints = {
        parameterHints = true,
        chainingHints = true,
      },
    },
  },
}
