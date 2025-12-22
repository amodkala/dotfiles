return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
  },
  settings = {
    lineLength = 88,
    lint = {
      enable = true,
    },
    format = {
      preview = false,
    },
    organizeImports = true,
    fixAll = true,
    showSyntaxErrors = true,
  },
}
