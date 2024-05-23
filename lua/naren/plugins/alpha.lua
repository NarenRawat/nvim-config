return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "  New File", "<cmd>ene<CR>"),
            dashboard.button(
                "SPC f f",
                "󰈞  Find File",
                "<Cmd>Telescope find_files<CR>"
            ),
            dashboard.button(
                "SPC f r",
                "󰋚  Recents",
                "<Cmd>Telescope oldfiles<CR>"
            ),
            dashboard.button(
                "SPC f s",
                "󱎸  Find Word",
                "<cmd>Telescope live_grep<CR>"
            ),
            dashboard.button(
                "SPC w r",
                "󰁯  Restore Session from CWD",
                "<cmd>SessionRestore<CR>"
            ),
            dashboard.button("q", "󰅖  Quit NVIM", "<cmd>qa<CR>"),
        }

        -- Show random quotes
        -- local fortune = require("alpha.fortune")
        -- dashboard.section.footer.val = fortune()
        dashboard.section.footer.val = "--> Welcome, "
            .. vim.g.username
            .. "! <--"

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
