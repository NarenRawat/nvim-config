local nightfly = {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nightflyCursorColor = true
        vim.g.nightflyTransparent = true
        vim.g.nightflyVirtualTextColor = true
        vim.g.nightflyWinSeparator = 2

        -- vim.cmd.colorscheme("nightfly")
    end,
}

local synthweave = {
    "samharju/synthweave.nvim",
    lazy = false,
    priority = 1000,
}

local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            style = "night",
            light_style = "day",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        })
        vim.cmd.colorscheme("tokyonight")
        vim.api.nvim_set_hl(0, "WinSeparator", { bold = true })
        vim.api.nvim_set_hl(
            0,
            "SpellBad",
            { bg = "red", fg = "black", underline = true }
        )
    end,
}

return {
    nightfly,
    synthweave,
    tokyonight,
}
