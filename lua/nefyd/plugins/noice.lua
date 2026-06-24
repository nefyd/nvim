return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        view = "cmdline_popup",
      },
      lsp = {
        progress = {
          enabled = false,
        },
      },
      messages = {
        enabled = true,
        view = "mini",
      },
      views = {
        mini = {
          timeout = 5000,
          size = {
            max_height = 5,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          position = {
            row = -2,
            col = "100%",
          },
          win_options = {
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "FloatBorder",
            },
          },
        },
      },
    })
  end,
}
