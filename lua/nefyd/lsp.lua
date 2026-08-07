local local_bin = vim.fs.joinpath(vim.fn.expand("~"), ".local", "bin")
local mason_bin = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin")
vim.env.PATH = local_bin .. ":" .. mason_bin .. ":" .. vim.env.PATH

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, desc = "Go to definition" }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  end,
})

local ROOT_MARKERS = {
  default = { ".git" },
  c_cpp = { "compile_commands.json", ".git" },
  rust = { "Cargo.toml", ".git" },
  python = { "pyproject.toml", "ruff.toml", "requirements.txt", ".git" },
  lua = { "init.lua", ".git" },
  glsl = { ".git" },
  haskell = {
    "stack.yaml",
    "cabal.project",
    "hie.yaml",
    ".git",
    function(name) return name:match("%.cabal$") ~= nil end,
  },
}

local function start(server_name, filetypes, cmd, opts)
  opts = opts or {}
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function(args)
      vim.lsp.start({
        name = server_name,
        cmd = cmd,
        root_dir = vim.fs.root(args.buf, opts.root_markers or ROOT_MARKERS.default),
        settings = opts.settings,
        capabilities = opts.capabilities,
      })
    end,
  })
end

local lua_library_paths = {
  vim.fn.expand("$VIMRUNTIME/lua"),
  vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "snacks", "lua.nvim"),
}
vim.list_extend(lua_library_paths, vim.api.nvim_get_runtime_file("", true))

local lua_settings = {
  Lua = {
    diagnostics = {
      globals = { "vim", "Snacks" },
    },
    workspace = {
      library = lua_library_paths,
      checkThirdParty = false,
    },
  },
}

local ty_capabilities = vim.lsp.protocol.make_client_capabilities()
ty_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

local SERVERS = {
  {
    name = "lua-language-server",
    filetypes = { "lua" },
    cmd = { "lua-language-server" },
    opts = { settings = lua_settings, root_markers = ROOT_MARKERS.lua },
  },
  {
    name = "clangd",
    filetypes = { "c", "cpp", "objc", "objcpp" },
    cmd = { "clangd" },
    opts = { root_markers = ROOT_MARKERS.c_cpp },
  },
  {
    name = "rust-analyzer",
    filetypes = { "rust" },
    cmd = { "rust-analyzer" },
    opts = { root_markers = ROOT_MARKERS.rust },
  },
  {
    name = "ruff",
    filetypes = { "python" },
    cmd = { "ruff", "server" },
    opts = { root_markers = ROOT_MARKERS.python },
  },
  {
    name = "glsl_analyzer",
    filetypes = { "glsl", "vert", "frag", "geom" },
    cmd = { "glsl_analyzer" },
    opts = { root_markers = ROOT_MARKERS.glsl },
  },
  {
    name = "ty",
    filetypes = { "python" },
    cmd = { "ty", "server" },
    opts = { capabilities = ty_capabilities, root_markers = ROOT_MARKERS.python },
  },
  {
    name = "haskell-language-server",
    filetypes = { "haskell" },
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    opts = { root_markers = ROOT_MARKERS.haskell },
  },
}

for _, server in ipairs(SERVERS) do
  start(server.name, server.filetypes, server.cmd, server.opts)
end
