--- leader ---

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

--- window navigation ---

map("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "go to right window" })
