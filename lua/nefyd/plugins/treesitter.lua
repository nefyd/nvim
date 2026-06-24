return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  init = function()
    -- Tell Neovim to use its built-in Treesitter engine for syntax highlighting
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        -- Enable modern, context-aware auto-indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  config = function()
    -- The new clean way to ensure your favorite parsers are installed automatically
    local essential_parsers = { 
      "lua", 
      "vim", 
      "vimdoc", 
      "query", 
      "markdown", 
      "markdown_inline", 
      "bash", 
      "json" 
    }
    require("nvim-treesitter").install(essential_parsers)
  end,
}
