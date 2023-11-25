local icons = require 'user.ui.icons'
local options = {
  enabled = true,
  exclude = {
    buftypes = { 'terminal', 'nofile' },
    filetypes = {
      'help',
      'startify',
      'dashboard',
      'lazy',
      'neogitstatus',
      'NvimTree',
      'Trouble',
      'text',
    },
  },
  indent = {char = icons.ui.LineLeft},
  -- context_char = icons.ui.LineLeft,
  -- show_trailing_blankline_indent = false,
  -- show_first_indent_level = true,
  -- use_treesitter = true,
  scope = {
    enabled = true,
    char = icons.ui.LineLeft,
    show_start = true,
    show_end = false,
    priority = 500,
    highlight = { "Function", "Label" },
  },
}

local M = {}
M.setup = function()
  local status_ok, indent_blankline = pcall(require, 'ibl')
  if not status_ok then
    return
  end

  indent_blankline.setup(options)
end

return M
