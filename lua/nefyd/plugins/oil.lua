return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    lazy = false,

    opts = {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        columns = {
            {
                "icon",
                align = "right",
            },
        },
        view_options = {
            show_hidden = false,
        },
        float = {
            padding = 4,
            border = "rounded",
        },
        preview = {
            border = "rounded",
        },
    },

    init = function()
        vim.keymap.set("n", "-", "<CMD>Oil --float --preview<CR>", {
            desc = "open oil (parent)"
        })
        vim.keymap.set("n", "+", "<CMD>Oil<CR>", {
            desc = "open oil (enter)"
        })
    end,
}
