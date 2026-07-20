return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Always pull the latest updates
  opts = {
    mode = "agentic",
    provider = "gemini",
    -- Move the gemini settings inside 'providers'
    providers = {
      gemini = {
        model = "gemini-2.5-flash",
        timeout = 30000,
      },
    },
  },
  -- Automatically build the necessary Rust binaries using make
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- Optional dependencies for UI icons and image pasting
    "nvim-tree/nvim-web-devicons",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- Recommended settings for dragging and dropping images into the chat
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
  },
}
