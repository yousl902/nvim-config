local icons = require 'user.ui.icons'
-- Configuration for diagnostics
local signs = {
  { name = 'DiagnosticSignError', text = icons.diagnostics.Error },
  { name = 'DiagnosticSignWarn', text = icons.diagnostics.Warning },
  { name = 'DiagnosticSignInfo', text = icons.diagnostics.Info },
  { name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

local config = {
  signs = {
    active = signs, -- show signs
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'single',
    source = 'always',
    header = 'Diagnostic',
    prefix = '',
  },
}

vim.diagnostic.config(config)
