-- dofile(vim.g.base46_cache .. "lsp")
-- require "nvchad.lsp"

local utils = require 'user.utils'

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
-- export on_attach & capabilities for custom lspconfigs

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- utils.load_mappings("lspconfig", { buffer = bufnr })
  -- load_mappings("lspconfig", { buffer = bufnr })

  -- if client.server_capabilities.signatureHelpProvider then
  --   require("nvchad.signature").setup(client)
  -- end

  -- if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
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

  on_attach = on_attach,

  -- NOTE: I added utf-16 to offsetEncoding in capabilities of nvchad
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

