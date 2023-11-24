local icons = require 'user.ui.icons'
local options = {
  enabled = true,
  buftype_exclude = { 'terminal', 'nofile' },
  filetype_exclude = {
    'help',
    'startify',
    'dashboard',
    'lazy',
    'neogitstatus',
    'NvimTree',
    'Trouble',
    'text',
  },
  char = icons.ui.LineLeft,
  context_char = icons.ui.LineLeft,
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
}

local M = {}
M.setup = function()
  local status_ok, indent_blankline = pcall(require, 'indent_blankline')
  if not status_ok then
    return
  end

  indent_blankline.setup(options)
end

return M
