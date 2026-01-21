return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- 1. SETUP CONFIGURATION (Must be set before loading the scheme)
      -- Enable transparency
      vim.g.everforest_transparent_background = 1

      -- Contrast Settings: Options are 'hard', 'medium', 'soft'.
      -- 'hard' usually gives the best text contrast against transparent backgrounds.
      vim.g.everforest_background = "hard"

      -- Better performance
      vim.g.everforest_better_performance = 1

      -- Load the colorscheme
      vim.cmd("colorscheme everforest")

      -- 2. FORCE TRANSPARENCY (Safety Net)
      -- Sometimes the theme misses the floating windows, this forces them clear.
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    end,
  },

  -- -- Disable other themes to prevent conflicts
  -- { "folke/tokyonight.nvim", enabled = false },
  -- { "rose-pine/neovim", enabled = false },
}
