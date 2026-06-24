return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 1000,
    icons = {
      mappings = false,
    },
    spec = {
      { "<leader>f", group = "find files and buffers" },
      { "<leader>r", group = "grep content" },
      { "<leader>g", group = "git integration" },
    },
  },
}
