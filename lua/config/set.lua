vim.g.copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node"
vim.g.node_host_prog = "~/.nvm/versions/node/v16.15.0/bin/node"

-- set nocompatible
vim.o.compatible = false

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
-- Configure indenting based on file type
-- vim.cmd([[
--   autocmd FileType html,javascript.jsx,typescript.jsx,css setlocal shiftwidth=2
-- ]])

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

-- split windows below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.iskeyword:append("-")

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

