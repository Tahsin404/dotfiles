return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_transparent_background = 1
      vim.g.everforest_background = "hard"
      vim.g.everforest_better_performance = 1

      local function apply_quickshell_theme()
        local cache_path = vim.fn.expand("~/.cache/quickshell_theme.json")
        local p = nil

        if vim.fn.filereadable(cache_path) == 1 then
          local ok, lines = pcall(vim.fn.readfile, cache_path)
          if ok and lines and #lines > 0 then
            local decoded_ok, data = pcall(vim.fn.json_decode, table.concat(lines, "\n"))
            if decoded_ok and type(data) == "table" then
              local is_dark = (data.isDark ~= false)
              local wall_is_dark = (data.wallIsDark == nil) and is_dark or (data.wallIsDark ~= false)

              if not is_dark and wall_is_dark and data.light and data.dark then
                -- Light Theme on a Dark Wallpaper:
                -- Keep dark background mode for transparency, but brighten all banners/fonts/accents to match Light Mode!
                vim.o.background = "dark"
                p = {
                  bgDark = data.light.textMain,
                  bgHover = data.dark.bgHover,
                  accent = data.light.bgBase,
                  hardwareRam = data.light.bgButton,
                  hardwareGpu = data.dark.accent,
                  textMain = data.dark.textMain,
                  textMuted = data.dark.textMuted,
                }
              else
                vim.o.background = is_dark and "dark" or "light"
                p = is_dark and data.dark or data.light
              end
            end
          end
        end

        vim.cmd("colorscheme everforest")

        -- Preserve full window transparency so Kitty's blurred glass shines through
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

        if p then
          vim.api.nvim_set_hl(0, "Normal", { fg = p.textMain, bg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalNC", { fg = p.textMain, bg = "NONE" })
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = p.accent, bg = "NONE" })
          vim.api.nvim_set_hl(0, "WinSeparator", { fg = p.bgHover, bg = "NONE" })
          vim.api.nvim_set_hl(0, "VertSplit", { fg = p.bgHover, bg = "NONE" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = p.accent, bold = true, bg = "NONE" })
          vim.api.nvim_set_hl(0, "LineNr", { fg = p.textMuted, bg = "NONE" })
          vim.api.nvim_set_hl(0, "Visual", { fg = p.bgDark, bg = p.accent })
          vim.api.nvim_set_hl(0, "Search", { fg = p.bgDark, bg = p.hardwareRam, bold = true })
          vim.api.nvim_set_hl(0, "IncSearch", { fg = p.bgDark, bg = p.accent, bold = true })
          vim.api.nvim_set_hl(0, "Directory", { fg = p.accent, bold = true })
          vim.api.nvim_set_hl(0, "Title", { fg = p.accent, bold = true })
          vim.api.nvim_set_hl(0, "Special", { fg = p.hardwareRam })
          vim.api.nvim_set_hl(0, "Identifier", { fg = p.textMain })
          vim.api.nvim_set_hl(0, "Function", { fg = p.accent, bold = true })
          vim.api.nvim_set_hl(0, "Statement", { fg = p.hardwareRam, bold = true })
          vim.api.nvim_set_hl(0, "Type", { fg = p.hardwareGpu, bold = true })

          -- Snacks.nvim Dashboard Highlights
          vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = p.accent, bold = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = p.accent })
          vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = p.textMain, bold = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = p.hardwareRam, bold = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = p.hardwareGpu, italic = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = p.accent, bold = true })
        end
      end

      apply_quickshell_theme()

      vim.api.nvim_create_autocmd("Signal", {
        pattern = "SIGUSR1",
        callback = function()
          vim.schedule(function()
            apply_quickshell_theme()
            if _G.reload_quickshell_lualine then
              _G.reload_quickshell_lualine()
            end
          end)
        end,
      })
    end,
  },
}
