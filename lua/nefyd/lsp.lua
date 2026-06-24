vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH

local function start_lsp(server_name, filetypes, cmd)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function(args)
      vim.lsp.start({
        name = server_name,
        cmd = cmd,
        root_dir = vim.fs.root(args.buf, { ".git", "Cargo.toml", "compile_commands.json", "init.lua" }),
      })
    end,
  })
end

start_lsp("lua-language-server", { "lua" }, { "lua-language-server" })
start_lsp("clangd", { "c", "cpp", "objc", "objcpp" }, { "clangd" })
start_lsp("rust-analyzer", { "rust" }, { "rust-analyzer" })
