return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "oil" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "diagnostics" },
      lualine_c = {
        { "%=" },
        { "filename", path = 0 },
      },
      lualine_x = { "branch" },
      lualine_y = {},
      lualine_z = { "location" },
    },
  },
}
