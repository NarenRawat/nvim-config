return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            sources = {

                formatting.stylua,
                formatting.isort,
                formatting.black,
                diagnostics.mypy,
                diagnostics.pylint,
            },
            on_attach = function(current_client, bufnr)
                if
                    current_client.supports_method("textDocument/formatting")
                then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                filter = function(client)
                                    return client.name == "null-ls"
                                end,
                                bufnr = bufnr,
                            })
                        end,
                    })
                end
            end,
        })

        vim.keymap.set(
            "n",
            "<leader>gf",
            vim.lsp.buf.format,
            { desc = "Format document" }
        )
    end,
}
