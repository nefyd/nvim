return {
  "saghen/blink.cmp",

  -- change when 2.x is stable --
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab"
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    completion = {
      documentation = {
        auto_show = true,
      },
      ghost_text = { enabled = true },
    },

    signature = {
      enabled = true,
      window = {
        border = "rounded",
      }
    },

    fuzzy = {
      sorts = { "score", "sort_text" },
    },
  },
  opts_extend = { "sources.default" },
}
