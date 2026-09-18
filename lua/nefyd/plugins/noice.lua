return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                timeout = 500,
                render = "wrapped-compact",
                max_width = 60,
                minimum_width = 0,
            },
        },
    },
    opts = {
        messages = {
            enabled = true,
            view = "notify",
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            long_message_to_split = true,
            lsp_doc_border = false,
        },
        cmdline = {
            enabled = true,
            view = "cmdline_popup",
        },
    },
    config = function(_, opts)
        require("noice").setup(opts)
    end,
}
