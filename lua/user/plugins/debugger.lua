return {
  {
    'andrewferrier/debugprint.nvim',
    opts = {
      create_keymaps = false,
      ...,
    },
  },

  -- -- Debugging
  {
    'mfussenegger/nvim-dap',
      config = function()
        require("user.configs.debbuger").setup()
      end,
    lazy = true,
    dependencies = {
      'rcarriga/nvim-dap-ui',
    },
    enabled = true,
    -- config = function()
    --   require 'user.configs.debugger'
    -- end,
  },

  -- -- Debugger user interface
  {
    'rcarriga/nvim-dap-ui',
      config = function()
        require("user.configs.debbuger").setup_ui()
      end,
    lazy = true,
    enabled = true,
    -- config = function()
    --   require('dapui').setup()
    -- end,
  },
  -- Python debugger
  {
    'mfussenegger/nvim-dap-python',
    'nvim-neotest/neotest',
    'nvim-neotest/neotest-python',
  },
}
