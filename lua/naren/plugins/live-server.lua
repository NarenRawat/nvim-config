return {
    "barrett-ruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = function()
        local live_server = require("live-server")

        live_server.setup({
            args = {
                "--host=0.0.0.0",
                "--port=8080",
            },
        })
    end,
}
