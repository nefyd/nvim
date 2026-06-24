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

--- system ---
vim.opt.mouse = ""
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = 'win32yank-wsl',
  copy = {
     ['+'] = 'win32yank.exe -i --crlf',
     ['*'] = 'win32yank.exe -i --crlf',
   },
  paste = {
     ['+'] = 'win32yank.exe -o --lf',
     ['*'] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}
