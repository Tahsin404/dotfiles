return {
  --1. Install nvim-ts-context-commentstring
  {
    "joosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false, -- Disable auto-update triggers
    },
  },

  --2. Configure mini.comment to use it
  {
    "mini.comment",
    dependencies = {
      "joosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      options = {
        -- This function calculates the correct comment string based on my cursor position
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
}
