return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      -- if lvim.builtin.cmp then
      require('user.configs.cmp').setup()
      -- end
    end,
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'cmp-nvim-lsp',
      'cmp_luasnip',
      'cmp-buffer',
      'cmp-path',
      'cmp-cmdline',
    },
  },
  { 'hrsh7th/cmp-nvim-lsp', lazy = true },
  { 'saadparwaiz1/cmp_luasnip', lazy = true },
  { 'hrsh7th/cmp-buffer', lazy = true },
  { 'hrsh7th/cmp-path', lazy = true },
  {
    'hrsh7th/cmp-cmdline',
    lazy = true,
    enabled = true,
  },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      -- local utils = require "lvim.utils"
      -- local paths = {}
      -- paths[#paths + 1] = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "friendly-snippets")
      -- local user_snippets = utils.join_paths(get_config_dir(), "snippets")
      -- if utils.is_directory(user_snippets) then
      --   paths[#paths + 1] = user_snippets
      -- end
      require('luasnip.loaders.from_lua').lazy_load()
      require('luasnip.loaders.from_vscode').lazy_load {
        -- paths = paths,
      }
      require('luasnip.loaders.from_snipmate').lazy_load()
    end,
    event = 'InsertEnter',
    dependencies = {
      'friendly-snippets',
    },
  },
  { 'rafamadriz/friendly-snippets', lazy = true, cond = true },

  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      vim.defer_fn(function()
        require('copilot').setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require('copilot_cmp').setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },

  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
  },
}
