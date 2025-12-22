return {
  cmd = { "ty", "server" },
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
    diagnosticMode = "openFilesOnly",
    inlayHints = {
      variableTypes = true,
      callArgumentNames = true,
    },
    completions = {
      autoImport = true,
    },
  },
}
