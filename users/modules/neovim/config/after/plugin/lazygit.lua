vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    require('lazygit.utils').project_root_dir()
  end,
})
vim.keymap.set('n', '<leader>gg', function()
  vim.cmd.LazyGit()
end)

