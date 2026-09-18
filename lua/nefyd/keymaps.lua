--- leader ---

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set;

--- editing shortcuts ---

map("n", "<leader>/", "gcc", { remap = true, desc = "toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "untoggle comment" })
map("n", "<leader>YY", "<cmd>%y+<CR>", { desc = "yank all" })
map("n", "<leader>DD", "<cmd>%d<CR>", { desc = "delete all" })
map("n", "<leader>nf", "<cmd>enew<CR>", { desc = "new file" })
map("i", "<C-z>", "<C-o>:normal! zz<CR>", { desc = "center screen" })

--- buffer navigation ---

map("n", "<leader>x", "<cmd>bd<cr>", { desc = "delete buffer" })
map("n", "[[", "<cmd>bp<cr>", { desc = "previous buffer" })
map("n", "]]", "<cmd>bn<cr>", { desc = "next buffer" })

--- window navigation ---

map("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "go to right window" })

--- terminal navigation ---

map('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'exit terminal mode' })

--- lsp ---

map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'rename all' })

map('n', 'K', function()
    local buffer = vim.api.nvim_get_current_buf()
    local window = vim.api.nvim_get_current_win()

    local clients = vim.lsp.get_clients({ bufnr = buffer })
    local encoding = clients[1] and
        clients[1].offset_encoding or 'utf-16'

    local params = vim.lsp.util.make_position_params(
        window, encoding
    )
    vim.lsp.buf_request(
        buffer,
        'textDocument/hover',
        params,
        function(_, result)
            if not result or not result.contents then return end

            local lines = vim.lsp.util
                .convert_input_to_markdown_lines(result.contents)

            lines = vim.split(
                table.concat(lines, "\n"),
                "\n",
                { trimempty = true }
            )
            if vim.tbl_isempty(lines) then return end

            local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
            local hover_buf = vim.lsp.util.open_floating_preview(
                lines,
                "markdown",
                {
                    border = border,
                    max_width = 80,
                    max_height = 20,
                    wrap = true,
                    focusable = true,
                    focus = false,
                    title = " Documentation ",
                    title_pos = "center",
                })
            local hover_win = vim.api.nvim_get_current_win()
            if hover_buf
                and vim.api.nvim_win_is_valid(hover_win)
                and vim.api.nvim_win_get_buf(hover_win) ==
                    hover_buf then
                vim.wo[hover_win].winblend      = 0
                vim.wo[hover_win].wrap          = true
                vim.wo[hover_win].linebreak     = true
                vim.wo[hover_win].conceallevel  = 2
                vim.wo[hover_win].concealcursor = "n"
            end
        end)
end, { desc = "documentation" })

map('i', '<C-k>', function()
  vim.lsp.buf.signature_help({
    max_width = 80,
    max_height = 20,
    border = "rounded",
  })
end, { desc = "parameters" })
