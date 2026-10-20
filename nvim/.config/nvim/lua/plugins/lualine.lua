return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function setup_quickshell_lualine()
      local colors = {
        onPill = "#080808",
        bgDark = "#080808",
        bgHover = "#4f4a44",
        accent = "#fab68c",
        secondary = "#db7e44",
        ram = "#79dac8",
        error = "#ff5189",
      }

      local cache_path = vim.fn.expand("~/.cache/quickshell_theme.json")
      if vim.fn.filereadable(cache_path) == 1 then
        local ok, lines = pcall(vim.fn.readfile, cache_path)
        if ok and lines and #lines > 0 then
          local decoded_ok, data = pcall(vim.fn.json_decode, table.concat(lines, "\n"))
          if decoded_ok and type(data) == "table" then
            local is_dark = (data.isDark ~= false)
            local wall_is_dark = (data.wallIsDark == nil) and is_dark or (data.wallIsDark ~= false)

            if not is_dark and wall_is_dark and data.light and data.dark then
              -- Light Theme on a Dark Wallpaper:
              -- Bright light pills (matching Quickshell's top bar) with dark text inside, on a sleek dark track
              colors.onPill = data.light.textMain or "#141414"
              colors.bgDark = data.dark.bgDark or "#080808"
              colors.bgHover = data.dark.bgBase or "#1e1e1e"
              colors.accent = data.light.bgBase or colors.accent
              colors.secondary = data.dark.accent or colors.secondary
              colors.ram = data.light.bgButton or colors.ram
              colors.error = data.light.error or colors.error
            else
              local p = is_dark and data.dark or data.light
              if p then
                colors.onPill = is_dark and (p.bgDark or "#080808") or (p.bgBase or "#ffffff")
                colors.bgDark = p.bgDark or colors.bgDark
                colors.bgHover = p.bgHover or colors.bgHover
                colors.accent = p.accent or colors.accent
                colors.secondary = p.hardwareGpu or colors.secondary
                colors.ram = p.hardwareRam or colors.ram
                colors.error = p.error or colors.error
              end
            end
          end
        end
      end

      local bubbles_theme = {
        normal = {
          a = { fg = colors.onPill, bg = colors.accent, gui = "bold" },
          b = { fg = colors.onPill, bg = colors.secondary },
          c = { fg = colors.accent, bg = colors.bgHover },
        },
        insert = { a = { fg = colors.onPill, bg = colors.ram, gui = "bold" } },
        visual = { a = { fg = colors.onPill, bg = colors.secondary, gui = "bold" } },
        replace = { a = { fg = colors.onPill, bg = colors.error, gui = "bold" } },
        inactive = {
          a = { fg = colors.accent, bg = colors.bgDark },
          b = { fg = colors.accent, bg = colors.bgDark },
          c = { fg = colors.accent, bg = colors.bgDark },
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
          lualine_c = { "%=" },
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
    end

    _G.reload_quickshell_lualine = setup_quickshell_lualine
    setup_quickshell_lualine()
  end,
}
