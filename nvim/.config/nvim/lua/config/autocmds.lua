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

vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
  pattern = "*.cpp",
  callback = function()
    -- Get all lines currently in the buffer
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    if #lines == 1 and lines[1] == "" then
      vim.cmd("0r ~/.config/nvim/templates/skeleton.cpp")
    end
  end,
})
