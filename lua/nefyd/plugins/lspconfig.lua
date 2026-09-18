return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false }
                }
            }
        })

        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--function-arg-placeholders=0"
            }
        })

        vim.lsp.enable({
            "lua_ls",
            "clangd",
            "rust_analyzer",
            "ruff"
        })
    end
}
