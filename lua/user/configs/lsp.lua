-- add border for floating windows
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- if you just want default config for the servers then put them in a table
local servers = {
  'html',
  'cssls',
  'tsserver',
  'clangd',
  'tailwindcss',
  'pyright',
  'rust_analyzer',
  'jdtls',
  'jsonls',
  'intelephense',
  'lua_ls',
  'sqlls',
}

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

---@diagnostic disable-next-line: different-requires
local lspconfig = require 'lspconfig'

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- C++
lspconfig.clangd.setup {
  keys = {
    { '<leader>cR', '<cmd>ClangdSwitchSourceHeader<cr>', desc = 'Switch Source/Header (C/C++)' },
  },

  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>lm', '<cmd>ClangdMemoryUsage<cr>', opts)
    require('clangd_extensions.inlay_hints').setup_autocmd()
    require('clangd_extensions.inlay_hints').set_inlay_hints()
  end,

  capabilities = vim.tbl_deep_extend('force', {
    offsetEncoding = { 'utf-16' },
  }, capabilities),
}

--Typescript
require('typescript-tools').setup {}

-- Lua
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

