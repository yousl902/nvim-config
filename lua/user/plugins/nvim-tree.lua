return {
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('user.configs.nvim-tree').setup()
    end,
    enabled = true,
    cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFocus', 'NvimTreeFindFileToggle' },
    event = 'User DirOpened',
  },
  -- {
  --   "tamago324/lir.nvim",
  --   config = function()
  --     require("lvim.core.lir").setup()
  --   end,
  --   enabled = lvim.builtin.lir.active,
  --   event = "User DirOpened",
  -- },
}
