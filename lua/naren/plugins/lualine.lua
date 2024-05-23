local virtual_env = function()
    -- only show virtual env for Python
    if vim.bo.filetype ~= "python" then
        return ""
    end

    local conda_env = os.getenv("CONDA_DEFAULT_ENV")
    local venv_path = os.getenv("VIRTUAL_ENV")

    if venv_path == nil then
        if conda_env == nil then
            return ""
        else
            return string.format("%s (conda)", conda_env)
        end
    else
        local venv_name = vim.fn.fnamemodify(venv_path, ":t")
        return string.format("%s (venv)", venv_name)
    end
end

local getcwd = function()
    -- return "Project: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        lualine.setup({
            options = {
                theme = "tokyonight",
                component_separators = "|",
                section_separators = { left = "", right = "" },
                always_divide_middle = false,
                disabled_filetypes = {
                    "alpha",
                    "lazy",
                    "mason",
                    "TelescopePrompt",
                },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = "" },
                    },
                },
                lualine_b = {
                    "filename",
                    "branch",
                    {
                        virtual_env,
                        icon = {
                            "",
                            color = { fg = "#F1CA81" },
                        },
                    },
                },
                lualine_c = {
                    "diff",
                    {
                        "diagnostics",
                        on_click = function()
                            -- Open trouble document diagnostics
                            -- window on click
                            -- vim.cmd("TroubleToggle document_diagnostics")
                            vim.cmd.TroubleToggle.document_diagnostics()
                        end,
                    },
                },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#FF9E64" },
                        component_separators = "",
                    },
                    { "fileformat", component_separators = "" },
                    { "encoding", component_separators = "" },
                },
                lualine_y = { "filetype", "progress" },
                lualine_z = {
                    {
                        "location",
                        separator = { right = "" },
                    },
                },
            },
            winbar = {
                lualine_b = require("lspsaga.symbol.winbar").get_bar(),
            },
            tabline = {
                lualine_a = {
                    {
                        function()
                            return " NEOVIM"
                        end,
                        separator = { left = "" },
                    },
                },
                lualine_b = {
                    "g:username",
                },
                lualine_c = {
                    "buffers",
                },
                lualine_x = {},
                lualine_y = {
                    getcwd,
                    -- {
                    --     "datetime",
                    --     style = "%I:%M:%S",
                    -- },
                },
                lualine_z = {
                    {
                        "datetime",
                        style = "%I:%M:%S",
                        separator = { right = "" },
                    },
                    -- {
                    --     "datetime",
                    --     style = "%a, %d %b",
                    --     separator = { right = "" },
                    -- },
                },
            },
            extensions = {},
        })
    end,
}
