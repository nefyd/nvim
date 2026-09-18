return {
    "saghen/blink.cmp",

    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "super-tab"
        },

        appearance = {
            nerd_font_variant = "normal",
        },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer"
            },
        },

        completion = {
            documentation = {
                auto_show = true,
            },
            ghost_text = {
                enabled = true
            },
        },

        signature = {
            enabled = true,
            window = {
                border = "rounded",
            }
        },

        fuzzy = {
            sorts = {
                "score",
                "sort_text"
            },
        },
    },
    opts_extend = {
        "sources.default"
    },
}
