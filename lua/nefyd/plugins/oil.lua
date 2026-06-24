return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  lazy = false,

  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    view_options = {
      show_hidden = false,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",   
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split", 
      ["<C-p>"] = "actions.preview",     
      ["<C-c>"] = "actions.close",      
      ["-"] = "actions.parent",        
      ["_"] = "actions.open_cwd",     
      ["g."] = "actions.toggle_hidden",
    },
  },
  init = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open oil" })
  end,
}
