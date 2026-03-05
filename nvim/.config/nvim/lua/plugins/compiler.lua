return {
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      -- Open the compiler menu
      { "<leader>co", "<cmd>CompilerOpen<cr>", desc = "Compiler Open" },
      -- Redo the last selected option (useful for repeated runs)
      { "<leader>cr", "<cmd>CompilerRedo<cr>", desc = "Compiler Redo" },
      -- Toggle the results window
      { "<leader>ct", "<cmd>CompilerToggleResults<cr>", desc = "Compiler Toggle Results" },
    },
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
