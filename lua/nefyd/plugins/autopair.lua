return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
    },
    disable_filetype = { "snacks_picker_input" },
    disable_in_macro = true,
  },
}
