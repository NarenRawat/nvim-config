return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        local virt_column = require("virt-column")

        virt_column.setup({
            char = "│",
            virtcolumn = "73, 80",
        })
    end,
}
