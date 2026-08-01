--- line numbers ---

vim.opt.number = true
vim.opt.relativenumber = true

--- indentation ---

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--- searching ---

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

--- wrapping ---

vim.opt.wrap = true

--- system ---

vim.opt.mouse = ""
vim.opt.termguicolors = true

--- clipboard ---

vim.opt.clipboard = "unnamedplus"

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
