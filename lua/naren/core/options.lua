-- Set leader to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.username = "Naren"

-- Enable termguicolors
vim.opt.termguicolors = true

-- Setup Spell Checker
vim.opt.spelllang = "en"
vim.opt.spelloptions = "camel"

-- Spellling
-- Make WinSeparator thicker
-- vim.opt.fillchars = {
--     horiz = "━",
--     horizup = "┻",
--     horizdown = "┳",
--     vert = "┃",
--     vertleft = "┫",
--     vertright = "┣",
--     verthoriz = "╋",
-- }

-- Show single statusline for all windows
vim.opt.laststatus = 3

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Make line numbers and realtive line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide default ruler
vim.opt.ruler = false

-- Replace tab with spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Disable line-wrap
vim.opt.wrap = false

-- Go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeout = true
vim.opt.timeoutlen = 300

--Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", space = "·" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10
