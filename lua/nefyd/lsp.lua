local LOCAL_BIN = vim.fs.joinpath(vim.fn.expand("~"), ".local", "bin")
local MASON_BIN = vim.fs.joinpath(
    vim.fn.stdpath("data"), "mason", "bin"
)
vim.env.PATH = LOCAL_BIN .. ":" .. MASON_BIN .. ":" .. vim.env.PATH

local ROOT_MARKERS = {
    default = {
        ".git"
    },
    c_cpp = {
        "compile_commands.json",
        ".git"
    },
    rust = {
        "Cargo.toml",
        ".git"
    },
    python = {
        "pyproject.toml",
        "ruff.toml",
        "requirements.txt",
        ".git"
    },
    lua = {
        "init.lua",
        ".git"
    },
    glsl = {
        ".git"
    },
    biome = {
        "biome.json",
        "biome.jsonc",
        "package.json",
        ".git"
    },
    tslsp = {
        "tsconfig.json",
        "jsconfig.json",
        "package.json",
        ".git"
    },
    haskell = {
        "stack.yaml",
        "cabal.project",
        "hie.yaml",
        ".git",
        function(name)
            return name:match("%.cabal$") ~= nil
        end
    },
    html = {
        "package.json",
        ".git"
    },
    css = {
        "package.json",
        "postcss.config.js",
        "tailwind.config.js",
        ".git"
    }
}

local TY_CAPABILITIES = vim.lsp.protocol.make_client_capabilities()
TY_CAPABILITIES
    .workspace
    .didChangeWatchedFiles
    .dynamicRegistration = true

local SERVERS = {
    {
        name = "lua-language-server",
        filetypes = {
            "lua"
        },
        cmd = {
            "lua-language-server"
        },
        opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                            "Snacks"
                        },
                    },
                workspace = {
                    library = {
                        vim.fn.expand("$VIMRUNTIME/lua")
                    },
                    checkThirdParty = false,
                    }
                }
            },
            root_markers = ROOT_MARKERS.lua
        }
    },
    {
        name = "clangd",
        filetypes = {
            "c",
            "cpp",
            "objc",
            "objcpp"
        },
        cmd = {
            "clangd"
        },
        opts = {
            root_markers = ROOT_MARKERS.c_cpp
        },
    },
    {
        name = "rust-analyzer",
        filetypes = {
            "rust"
        },
        cmd = {
            "rust-analyzer"
        },
        opts = {
            root_markers = ROOT_MARKERS.rust
        }
    },
    {
        name = "ruff",
        filetypes = {
            "python"
        },
        cmd = {
            "ruff",
            "server"
        },
        opts = {
            root_markers = ROOT_MARKERS.python
        }
    },
    {
        name = "glsl_analyzer",
        filetypes = {
            "glsl",
            "vert",
            "frag",
            "geom"
        },
        cmd = {
            "glsl_analyzer"
        },
        opts = {
            root_markers = ROOT_MARKERS.glsl
        }
    },
    {
        name = "ty",
        filetypes = {
            "python"
        },
        cmd = {
            "ty",
            "server"
        },
        opts = {
            capabilities = TY_CAPABILITIES,
            root_markers = ROOT_MARKERS.python
        }
    },
    {
        name = "haskell-language-server",
        filetypes = {
            "haskell"
        },
        cmd = {
            "haskell-language-server-wrapper",
            "--lsp"
        },
        opts = {
            root_markers = ROOT_MARKERS.haskell
        }
    },
    {
        name = "biome",
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "jsonc",
        },
        cmd = {
            "biome",
            "lsp-proxy"
        },
        opts = {
            root_markers = ROOT_MARKERS.biome
        }
    },
    {
        name = "typescript-language-server",
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact"
        },
        cmd = {
            "typescript-language-server",
            "--stdio"
        },
        opts = {
            root_markers = ROOT_MARKERS.tslsp
        }
    },
    {
        name = "html",
        filetypes = {
            "html"
        },
        cmd = {
            "vscode-html-language-server",
            "--stdio"
        },
        opts = {
            root_markers = ROOT_MARKERS.html
        }
    },
    {
        name = "cssls",
        filetypes = {
            "css",
            "scss",
            "less"
        },
        cmd = {
            "vscode-css-language-server",
            "--stdio"
        },
        opts = {
            root_markers = ROOT_MARKERS.css
        }
    }
}

local function start(server, filetypes, cmd, opts)
    opts = opts or {}
    vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function(args)
        vim.lsp.start({
            name = server,
            cmd = cmd,
            settings = opts.settings,
            capabilities = opts.capabilities,
            root_dir = vim.fs.root(
                args.buf,
                opts.root_markers or ROOT_MARKERS.default
            )
        })
    end
    })
end

for _, server in ipairs(SERVERS) do
    start(
        server.name,
        server.filetypes,
        server.cmd,
        server.opts
    )
end
