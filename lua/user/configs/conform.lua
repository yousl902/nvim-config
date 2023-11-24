local options = {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    svelte = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    json = { 'prettier' },
    sh = { 'shfmt' },
    cpp = { 'clang_format' },
    c = { 'clang_format' },
    python = { 'isort', 'black' },
    java = { 'astyle' },
    rust = { 'rustfmt' },
  },

  -- format_on_save = {
  --   lsp_fallback = true,
  --   async = true,
  --   timeout_ms = 500,
  -- },
}

-- change clang_format indentaion to 4 spaces
local args = require('conform.formatters.clang_format').args
table.insert(args, '-style={IndentWidth: 4}')

require('conform').setup(options)
