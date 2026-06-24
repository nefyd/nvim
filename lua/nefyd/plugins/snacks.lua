return {
  "folke/snacks.nvim",
  
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    picker = { enabled = true },
  
    git = { enabled = true },
    gitblame = { enabled = true },
  
    statuscolumn = { enabled = true },
  },

  keys = {
    -- general finders --
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "adaptive find" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "find files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "find recent files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "find buffers" },

    -- content finders --
    { "<leader>fc", function() Snacks.picker.grep() end, desc = "find content" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "find word under cursor", mode = { "n", "x" } },

    -- git integration --
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "git branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "git log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "git log current line)" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status (diff picker)" },
    { "<leader>gB", function() Snacks.gitblame.toggle() end, desc = "toggle inline git blame" },
  },
}
