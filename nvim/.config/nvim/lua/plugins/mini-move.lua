return {
  "nvim-mini/mini.move",
  version = false,
  config = function()
    require("mini.move").setup({
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<S-left>",
        right = "<S-right>",
        down = "<S-down>",
        up = "<S-up>",

        -- Move current line in Normal mode
        line_left = "<S-left>",
        line_right = "<S-right>",
        line_down = "<S-down>",
        line_up = "<S-up>",
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    })
  end,
}
