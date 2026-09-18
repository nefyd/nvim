return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@type snacks.Config
    opts = {
        -- Enabled features
        picker = { enabled = true },
        statuscolumn = { enabled = true },
        quickfile = { enabled = true },
        bigfile = { enabled = true },
        indent = { enabled = true },
        scope = { enabled = true },

        -- Disabled features
        bufdelete = { enabled = false },
        dashboard = { enabled = false },
        dim = { enabled = false },
        explorer = { enabled = false },
        gh = { enabled = false },
        git = { enabled = false },
        gitbrowse = { enabled = false },
        image = { enabled = false },
        input = { enabled = false },
        lazygit = { enabled = false },
        notifier = { enabled = false },
        profiler = { enabled = false },
        rename = { enabled = false },
        scratch = { enabled = false },
        scroll = { enabled = false },
        terminal = { enabled = false },
        toggle = { enabled = false },
        words = { enabled = false },
        zen = { enabled = false },
    },

    config = function(_, opts)
        local notify = vim.notify
        require("snacks").setup(opts)
        -- Restore vim.notify so noice.nvim can take over the cmdline UI
        vim.notify = notify
    end,

    keys = {
        -- general finders --
        {
            "<leader><leader>",
            function()
                Snacks.picker.smart()
            end,
            desc = "adaptive find"
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "find files"
        },

        -- content finders --
        {
            "<leader>fc",
            function()
                Snacks.picker.grep()
            end,
            desc = "find content"
        },
        {
            "<leader>fw",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "find word under cursor",
            mode = { "n", "x" }
        },
    },
}
