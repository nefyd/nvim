return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("lua_ls", {
            cmd = { "lua-language-server" },
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "Snacks" },
                    },
                    workspace = {
                        checkThirdParty = false,
                    },
                },
            },
        })

        vim.lsp.enable({
            "lua_ls",
            "clangd",
            "rust_analyzer",
            "ruff",
            "ts_ls",
            "html",
            "cssls",
            "biome",
        })
    end,
}
