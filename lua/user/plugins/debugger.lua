return {
  --   {
  --   "andrewferrier/debugprint.nvim",
  --   opts = {
  --     create_keymaps = false,
  --     ...,
  --   },
  -- },

  -- -- Debugging
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     require("lvim.core.dap").setup()
  --   end,
  --   lazy = true,
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui",
  --   },
  --   enabled = lvim.builtin.dap.active,
  -- },

  -- -- Debugger user interface
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   config = function()
  --     require("lvim.core.dap").setup_ui()
  --   end,
  --   lazy = true,
  --   enabled = lvim.builtin.dap.active,
  -- },
}
