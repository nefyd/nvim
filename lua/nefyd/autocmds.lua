local group = vim.api.nvim_create_augroup("config", {clear = true})

vim.api.nvim_create_autocmd("FileType", {
    -- tab in Makefiles
    group = group,
    pattern = "make",
    callback = function()
        vim.bo.expandtab  = false
        vim.bo.tabstop    = 4
        vim.bo.shiftwidth = 4
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    -- go-to definition for LSP
    group = group,
    callback = function(args)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
            buffer = args.buf,
            desc = "go-to definition"
        })
    end,
})
