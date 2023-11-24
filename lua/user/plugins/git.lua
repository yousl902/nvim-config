return {
  {
    'tpope/vim-rhubarb',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('user.configs.gitsigns').setup()
    end,
    -- event = "User FileOpened",
    event = 'BufRead',
    cmd = 'Gitsigns',
    enabled = true,
  },

  -- git wrapper
  {
    'tpope/vim-fugitive',
    cmd = {
      'G',
      'Git',
      'Gdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GDelete',
      'GBrowse',
      'GRemove',
      'GRename',
      'Glgrep',
      'Gedit',
    },
    ft = { 'fugitive' },
  },

  {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = 'LazyGit',
    keys = { { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' } },
  },

  -- {
  --   "pwntester/octo.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("octo").setup()
  --   end,
  -- },
}
