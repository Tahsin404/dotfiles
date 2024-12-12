return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  peach  = '#080808',
  white  = '#db7e44',
  red    = '#ff5189',
  black =  '#fab68c',
  grey   = '#79dac8',
}

    local bubbles_theme = {
      normal = {
        a = { fg = colors.peach, bg = colors.black },
        b = { fg = colors.peach, bg = colors.white },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.peach, bg = colors.black } },
      visual = { a = { fg = colors.peach, bg = colors.black } },
      replace = { a = { fg = colors.peach, bg = colors.cyan } },

      inactive = {
        a = { fg = colors.white, bg = colors.peach },
        b = { fg = colors.white, bg = colors.peach },
        c = { fg = colors.white },
      },
    }

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", "branch" },
        lualine_c = {
          "%=", --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
