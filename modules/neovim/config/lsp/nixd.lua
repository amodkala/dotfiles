return {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = {
    ".git",
    "flake.nix",
    "flake.lock",
  },
  settings = {
    nixd = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
}
