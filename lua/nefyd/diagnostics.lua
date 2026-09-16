vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        spacing = 1,
    },
    float = {
        border = "rounded",
        wrap = true,
        max_width = 80,
        format = function(diagnostic)
            return string.sub(diagnostic.message, 1, 40)
                .. (#diagnostic.message > 40 and "..." or "")
        end
    }
})
