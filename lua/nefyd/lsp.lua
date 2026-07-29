local local_bin = vim.fs.joinpath(vim.fn.expand("~"), ".local", "bin")
local mason_bin = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin")
vim.env.PATH = local_bin .. ":" .. mason_bin .. ":" .. vim.env.PATH

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, desc = "Go to definition" }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  end,
})

local function start(server_name, filetypes, cmd, settings, capabilities)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function(args)
      vim.lsp.start({
        name = server_name,
        cmd = cmd,
        root_dir = vim.fs.root(args.buf, {
          "pyproject.toml",
          "ruff.toml",
          "requirements.txt",
          ".git",
          "Cargo.toml",
          "compile_commands.json",
          "init.lua"
        }),
        settings = settings,
        capabilities = capabilities,
      })
    end,
  })
end

local lua_library_paths = {
  vim.fn.expand("$VIMRUNTIME/lua"),
  vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "snacks", "lua.nvim"),
}
vim.list_extend(lua_library_paths, vim.api.nvim_get_runtime_file("", true))

start("lua-language-server", { "lua" }, { "lua-language-server" }, {
  Lua = {
    diagnostics = {
      globals = { "vim", "Snacks" },
    },
    workspace = {
      library = lua_library_paths,
      checkThirdParty = false,
    },
  },
})

start("clangd", { "c", "cpp", "objc", "objcpp" }, { "clangd" })
start("rust-analyzer", { "rust" }, { "rust-analyzer" })
start("ruff", { "python" }, { "ruff", "server" })
start("glsl_analyzer", { "glsl", "vert", "frag", "geom" }, { "glsl_analyzer" })

local ty_capabilities = vim.lsp.protocol.make_client_capabilities()
ty_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

start("ty", { "python" }, { "ty", "server" }, nil, ty_capabilities)
