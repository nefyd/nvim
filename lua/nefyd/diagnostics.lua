local function truncate(diagnostic)
    local msg = diagnostic.message
    if #msg > 40 then
        msg = string.sub(msg, 1, 40) .. "..."
    end
    return msg
end

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,

    virtual_text = {
        prefix = '●',
        spacing = 1,
        format = function(d)
            return truncate(d)
        end,
    },

    float = {
        border = "rounded",
        wrap = true,
        max_width = 80,
        format = function(d)
            return truncate(d)
        end,
    },
})
