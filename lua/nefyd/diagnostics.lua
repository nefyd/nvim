vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = '●',
    format = function(diagnostic)
      return string.sub(diagnostic.message, 1, 40) .. (#diagnostic.message > 40 and "..." or "")
    end,
  },
  float = {
    border = "rounded",
    wrap = true,
    max_width = 80,
  },
})
