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
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["-"] = "actions.parent",
            ["+"] = "actions.select",
            ["_"] = "actions.open_cwd",
            ["g."] = "actions.toggle_hidden",
        },
    },
    init = function()
        vim.keymap.set("n", "-", "<CMD>Oil --float --preview<CR>", { desc = "open oil (parent)" })
        vim.keymap.set("n", "+", "<CMD>Oil<CR>", { desc = "open oil (enter)" })
    end,
}
