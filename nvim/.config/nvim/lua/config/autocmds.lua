-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--Fix commenting specifically for kitty.conf
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "kitty.conf",
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})
