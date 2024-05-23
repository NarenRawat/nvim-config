return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "debugloop/telescope-undo.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            pickers = {
                find_files = { theme = "dropdown" },
                live_grep = { theme = "dropdown" },
                help_tags = { theme = "dropdown" },
                oldfiles = { theme = "dropdown" },
                grep_string = { theme = "dropdown" },
            },
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist
                            + actions.open_qflist,
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("undo")

        -- vim.keymap.set(
        --     "n",
        --     "<leader>u",
        --     "<cmd>Telescope undo<CR>",
        --     { desc = "Open Undotree" }
        -- )

        vim.keymap.set(
            "n",
            "<leader>ff",
            builtin.find_files,
            { desc = "Fuzzy find files in cwd" }
        )
        vim.keymap.set(
            "n",
            "<leader>fr",
            builtin.oldfiles,
            { desc = "Fuzzy find recent files" }
        )
        vim.keymap.set(
            "n",
            "<leader>fs",
            builtin.live_grep,
            { desc = "Find string in cwd" }
        )
        vim.keymap.set(
            "n",
            "<leader>fc",
            builtin.grep_string,
            { desc = "Find string under cursor in cwd" }
        )
        vim.keymap.set(
            "n",
            "<leader>ft",
            "<cmd>TodoTelescope<CR>",
            { desc = "Find todos" }
        )
    end,
}
