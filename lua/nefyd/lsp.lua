vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH

local function start(server_name, filetypes, cmd)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function(args)
      local library_paths = {
        vim.fn.expand("$VIMRUNTIME/lua"),
        vim.fn.stdpath("data") .. "/lazy/snacks/lua.nvim",
      }
      vim.list_extend(library_paths, vim.api.nvim_get_runtime_file("", true))

      vim.lsp.start({
        name = server_name,
        cmd = cmd,
        root_dir = vim.fs.root(args.buf, { ".git", "Cargo.toml", "compile_commands.json", "init.lua" }),
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "Snacks" },
            },
            workspace = {
              library = library_paths,
              checkThirdParty = false,
            },
          },
        },
      })
      local opts = { buffer = args.buf, desc = "go to definition" }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    end,
  })
end

start("lua-language-server", { "lua" }, { "lua-language-server" })
start("clangd", { "c", "cpp", "objc", "objcpp" }, { "clangd" })
start("rust-analyzer", { "rust" }, { "rust-analyzer" })

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})
