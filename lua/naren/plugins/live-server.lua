return {
    "barrett-ruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = function()
        local live_server = require("live-server")

        live_server.setup({
            args = {
                "--host=0.0.0.0",
                "--port=8080",
                "--browser=/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe",
            },
        })
    end,
}
