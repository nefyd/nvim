vim.api.nvim_create_autocmd("FileType", {
    -- switch to tabs instead for Make files
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end
})

vim.api.nvim_create_autocmd("FileType", {
    -- fix auto indent for C files
    pattern = "c",
    callback = function()
        vim.bo.indentexpr = ""
        vim.bo.cindent = true
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    -- map 'gd' in normal mode to "go to definition" on LspAttach
    callback = function(args)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = args.buf,
            desc = "Go to definition"
        })
    end,
})
