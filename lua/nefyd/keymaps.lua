--- leader ---

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set;

--- window navigation ---

map("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "go to right window" })

--- buffer navigation ---

map("n", "<leader>x", "<cmd>bd<cr>", { desc = "delete buffer" })
map("n", "<S-Tab>", "<cmd>bn<cr>", { desc = "next buffer" })

map("n", "<leader>/", "gcc", { remap = true, desc = "toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "toggle comment" })
