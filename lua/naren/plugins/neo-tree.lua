return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set(
            "n",
            "<C-n>",
            "<Cmd>Neotree filesystem toggle left<CR>",
            {}
        )
        vim.keymap.set(
            "n",
            "<leader>bf",
            "<Cmd>Neotree buffers reveal float<CR>",
            {}
        )
        require("neo-tree").setup({
            filesystem = {
                hijack_netrw_behavior = "open_current",
            },
        })
    end,
}
