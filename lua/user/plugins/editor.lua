return {
  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    init = function()
      require('user.configs.toggleterm').init()
    end,
    config = function()
      require('user.configs.toggleterm').setup()
    end,
    cmd = {
      'ToggleTerm',
      'TermExec',
      'ToggleTermToggleAll',
      'ToggleTermSendCurrentLine',
      'ToggleTermSendVisualLines',
      'ToggleTermSendVisualSelection',
    },
    keys = '<leader>tt',
    enabled = true,
  },

  -- SchemaStore
  {
    'b0o/schemastore.nvim',
    lazy = true,
  },

  -- TODO: I have the same plugin in treesitter, chaech which config I want to keep
  -- {
  --   "RRethy/vim-illuminate",
  --   config = function()
  --     require("lvim.core.illuminate").setup()
  --   end,
  --   event = "User FileOpened",
  --   enabled = lvim.builtin.illuminate.active,
  -- },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('user.configs.indentlines').setup()
    end,
    event = 'User FileOpened',
    enabled = true,
  },

  -- {
  --   "lunarvim/onedarker.nvim",
  --   branch = "freeze",
  --   config = function()
  --     pcall(function()
  --       if lvim and lvim.colorscheme == "onedarker" then
  --         require("onedarker").setup()
  --         lvim.builtin.lualine.options.theme = "onedarker"
  --       end
  --     end)
  --   end,
  --   lazy = lvim.colorscheme ~= "onedarker",
  -- },

  {
    'folke/which-key.nvim',
    config = function()
      require('user.configs.which-key').setup()
    end,
    cmd = 'WhichKey',
    event = 'VeryLazy',
    enabled = true,
  },
  {
    'folke/neodev.nvim',
    lazy = true,
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}, -- this is equalent to setup({}) function
    -- config = function()
    --   require("lvim.core.autopairs").setup()
    -- end,
    enabled = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'hrsh7th/nvim-cmp' },
  },

  { 'Tastyep/structlog.nvim', lazy = true },
  { 'nvim-lua/plenary.nvim', cmd = { 'PlenaryBustedFile', 'PlenaryBustedDirectory' }, lazy = true },
  -- very cool plugin, learn to use it
  {
    'metakirby5/codi.vim',
    cmd = 'Codi',
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('symbols-outline').setup()
    end,
  },
  {
    'CRAG666/code_runner.nvim',
    config = function()
      require 'user.configs.coderunner'
    end,
  },
  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    enabled = true,
    lazy = true,
  },
  {
    'windwp/nvim-spectre',
    event = 'BufRead',
    config = function()
      require('spectre').setup()
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
    config = function(_, opts)
      require('colorizer').setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require('colorizer').attach_to_buffer(0)
      end, 0)
    end,
  },

  -- Comment plugins
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('user.configs.comment').pre_hook,
      }
    end,
    keys = { { 'gc', mode = { 'n', 'v' } }, { 'gb', mode = { 'n', 'v' } } },
    event = 'User FileOpened',
  },
  {
    -- Lazy loaded by Comment.nvim pre_hook
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
  },
  {
    'dstein64/vim-startuptime',
  },

  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },
  {
    'mg979/vim-visual-multi',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  {
    'ggandor/leap.nvim',
    event = 'BufRead',
  },

  {
    'code-biscuits/nvim-biscuits',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
    },
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('nvim-biscuits').setup {
        cursor_line_only = true,
      }
    end,
  },
  {
    'nvim-lua/plenary.nvim',
    'theprimeagen/harpoon',
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'mbbill/undotree',
    keys = {
      {
        '<leader>u',
        vim.cmd.UndotreeToggle,
        desc = 'Toggle undotree',
      },
    },
  },
  {
    'tpope/vim-surround',
  }, -- add, delete, change surroundings (it's awesome)

  -- {
  --   "inkarkat/vim-ReplaceWithRegister",
  --   keys = {
  --     "gr",
  --   },
  -- }, -- replace with register contents using motion (gr + motion)

  -- {
  --   "p00f/nvim-ts-rainbow",
  -- },

  -- -- to learn basic vim commands
  -- {
  --   "ThePrimeagen/vim-be-good",
  -- },

  {
    'vimwiki/vimwiki',
    keys = {
      '<leader>ww',
    },
  },

  {
    'aurum77/live-server.nvim',
    event = 'BufRead',
    build = function()
      require('live_server.util').install()
    end,
    cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' },
    config = function()
      require('live_server').setup {}
    end,
  },

  -- {
  --   "ziontee113/color-picker.nvim",
  --   -- event = "InsertEnter",
  --   config = function()
  --     require("color-picker").setup {
  --       ["icons"] = { "ﱢ", "" },
  --     }
  --   end,
  --   keys = {
  --     { "<C-v>", "<cmd>PickColor<CR>", desc = "Pick Color" },
  --     { "<C-v>", "<cmd>PickColorInsert<CR>", mode = "i", desc = "Pick Color Insert" },
  --   },
  -- },

  {
    'pocco81/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    config = function()
      require('auto-save').setup()
    end,
  },

  -- TODO: check this when working when tailwindcss
  -- {
  --   "roobert/tailwindcss-colorizer-cmp.nvim",
  --   -- optionally, override the default options:
  --   config = function()
  --     require("tailwindcss-colorizer-cmp").setup {
  --       color_square_width = 2,
  --     }
  --   end,
  -- },
  -- NOTE: autoclose tags in html, jsx only, I may need it in react
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'BufRead',
    config = function()
      require('refactoring').setup()
    end,
  },

  -- {
  --   "cshuaimin/ssr.nvim",
  --   module = "ssr",
  --   -- event = "BufRead",
  --   config = function()
  --     require("ssr").setup {}
  --   end,
  --   keys = {
  --     {
  --       "<leader>sr",
  --       function()
  --         require("ssr").open()
  --       end,
  --       desc = "Run SSR",
  --     },
  --   },
  -- },
}
