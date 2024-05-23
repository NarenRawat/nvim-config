return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local lspsaga = require("lspsaga")

        lspsaga.setup({
            lightbulb = { virtual_text = false },
            symbol_in_winbar = {
                folder_level = 0,
                hide_keyword = true,
                separator = "  ", -- > 
            },
            code_actions = {
                show_server_name = true,
            },
        })
    end,
}
