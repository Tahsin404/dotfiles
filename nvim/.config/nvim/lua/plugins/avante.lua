return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Always pull the latest updates
  opts = {
    mode = "agentic",
    provider = "omniroute",
    vendors = {
      omniroute = {
        __inherited_from = "openai",
        endpoint = "http://localhost:20128/v1",
        -- OmniRoute requires no API key locally, so we feed it a dummy string
        api_key_name = "cmd:echo 'dummy-key'",
        -- Set this to the exact model name you enabled in the OmniRoute dashboard
        model = "auto",
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
