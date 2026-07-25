--- leader ---

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set;

--- window navigation ---

map("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "go to right window" })

--- tab navigation ---

map("n", "<leader>t", "<cmd>tabnew<cr>", { desc = "new tab" })
map("n", "<C-]>", "<cmd>tabnext<cr>", { desc = "next tab" })
map("n", "<C-x>x", "<cmd>tabclose<cr>", { desc = "close tab" })

--- buffer navigation ---

map("n", "<leader>x", "<cmd>bd<cr>", { desc = "delete buffer" })
map("n", "<S-Tab>", "<cmd>bn<cr>", { desc = "next buffer" })

map("n", "<leader>/", "gcc", { remap = true, desc = "toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "toggle comment" })

--- terminal navigation ---

map('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'exit terminal mode' })

--- lsp shortcuts ---

map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'rename all' })
map('n', 'K', function()
  vim.lsp.buf.hover({
    max_width = 80,
    max_height = 20,
    border = "rounded",
  })
end, { desc = "documentation" })
map('i', '<C-k>', function()
  vim.lsp.buf.signature_help({
    max_width = 80,
    max_height = 20,
    border = "rounded",
  })
end, { desc = "signature docs" })

--- editing shortcuts ---

map("n", "<leader>YY", "<cmd>%y+<CR>", { desc = "yank all" })
map("n", "<leader>nf", "<cmd>enew<CR>", { desc = "new file" })
map("i", "<C-z>", "<C-o>:normal! zz<CR>", { desc = "center screen" })
map("n", "<leader>DD", "<cmd>%d<CR>", { desc = "delete all" })
