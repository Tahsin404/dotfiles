return {
  -- 1. Enable QML Language Server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          -- Arch sometimes suffixes Qt6 binaries with '6'.
          -- If autocomplete fails, change this cmd to "qmlls"
          cmd = { "qmlls6" },
          filetypes = { "qml", "qmljs" },
        },
      },
    },
  },

  -- 2. Enable QML Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "qmljs" },
    },
  },
}
