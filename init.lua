vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

local config_dir = vim.fn.stdpath("config") .. "/lua/nefyd"
for _, file in ipairs(vim.fn.glob(config_dir .. "/*.lua", false, true)) do
    local module_name = file:match("([^/]+)%.lua$")
    require("nefyd." .. module_name)
end
