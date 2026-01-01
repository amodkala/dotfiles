-- keybindings
vim.g.mapleader = " "

-- vim settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

vim.opt.termguicolors = true

vim.opt.completeopt:append { 'noselect' }
vim.opt.shortmess:append('c')


vim.opt.scrolloff = 8

-- colorscheme
vim.cmd.colorscheme "catppuccin"

-- native lsp
vim.lsp.enable({
  'gopls',
  'hls',
  'luals',
  'nixd',
  'ruff',
  'rust-analyzer',
  'tinymist',
  'ty',
  'wgsl-analyzer',
})

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    -- if client:supports_method('textDocument/inlayHint') then
    --   vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    -- end

    if client:supports_method('textDocument/formatting') then
      -- Format the current buffer on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ async = false, bufnr = args.buf, id = client.id })
        end,
      })
    end
  end,
})

-- completion

local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    -- navigate to next item in completion menu
    return '<Down>'
  end

  local c = vim.fn.col('.') - 1
  local is_whitespace = c == 0 or vim.fn.getline('.'):sub(c, c):match('%s')

  if is_whitespace then
    -- insert tab
    return '<Tab>'
  end

  local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'

  if lsp_completion then
    -- trigger lsp code completion
    return '<C-x><C-o>'
  end

  -- suggest words in current buffer
  return '<C-x><C-n>'
end

local function tab_prev()
  if vim.fn.pumvisible() == 1 then
    -- navigate to previous item in completion menu
    return '<Up>'
  end

  -- insert tab
  return '<Tab>'
end

vim.keymap.set('i', '<Tab>', tab_complete, { expr = true })
vim.keymap.set('i', '<S-Tab>', tab_prev, { expr = true })
