-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Open compiler
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
  "n",
  "<leader>cr",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
    .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true }
)

-- Stop the current taks
vim.keymap.set("n", "<leader>cs", "<cmd>CompilerStop<cr>", { desc = "Compiler Stop" })

-- Toggle compiler results
vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Increment and decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb-d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sp", ":vsplit<Return>")

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Press <leader>r to instantly change the word under the cursor, then use . and n
vim.keymap.set("n", "<leader>r", "*cgn", { desc = "Replace word under cursor" })

-- Compile and run C code directly
-- Press <Space> + c + c to run
vim.keymap.set("n", "<leader>cc", function()
  local file = vim.fn.expand("%:p") -- Full path to .c file
  local dir = vim.fn.expand("%:p:h") -- Directory of current file
  local filename = vim.fn.expand("%:t:r") -- Filename without extension
  local bin_dir = dir .. "/bin"
  local output = bin_dir .. "/" .. filename -- Path to executable

  -- The Fix: Added 'echo' for clarity and 'read' to pause the terminal
  local cmd = string.format(
    "mkdir -p %s && gcc %s -o %s -Wall -lm && time %s; echo -e '\\n--- Press Enter to close ---'; read",
    bin_dir,
    file,
    output,
    output
  )

  if _G.Snacks then
    _G.Snacks.terminal.open(cmd, {
      win = { position = "float" },
      title = " C Build & Run ",
    })
  else
    vim.cmd("split | term " .. cmd)
  end
end, { desc = "Compile and Run C (Wait for Enter)" })
