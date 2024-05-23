return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local noice = require("noice")

        noice.setup({
            presets = {
                -- bottom_search = true,
                lsp_doc_border = true,
                command_palette = true,
                long_message_to_split = true,
            },
            routes = {
                {
                    view = "notify",
                    filter = { event = "msg_showmode" },
                },
                {
                    filter = {
                        event = "lsp",
                        kind = "progress",
                        cond = function(message)
                            local client =
                                vim.tbl_get(message.opts, "progress", "client")
                            return client == "null_ls"
                        end,
                    },
                    opts = { skip = true },
                },
            },
        })
    end,
}
