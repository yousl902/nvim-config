local Icon = require("custom.res.icons")
local Util = require("custom.util")

return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = { "InsertEnter" },
    opts = {
      floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
      floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
      hint_scheme = "Comment", -- highlight group for the virtual text
    },
  },

  {
    "glepnir/lspsaga.nvim",
    lazy = true,
    config = function()
      require("lspsaga").setup({})
    end,
  },

  {
    "jackMort/ChatGPT.nvim",
    lazy = require("custom.util").apikey == nil,
    -- config = function()
    --   require("chatgpt").setup({
    --     api_key_cmd = require("custom.util").apikey,
    --   })
    -- end,
    --config = { api_key_cmd = "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" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
  },
-- 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
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>n",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      icons = {
        ERROR = Icon.diagnostics.error .. " ",
        INFO = Icon.diagnostics.info .. " ",
        WARN = Icon.diagnostics.warn .. " ",
      },
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },

  {
    'sansyrox/vim-python-virtualenv'
  },
  -- {'abenz1267/nvim-databasehelper', opt = true},
  -- {
  --   'kristijanhusak/vim-dadbod-ui',
  --   requires = {'tpope/vim-dadbod'},
  --   opt = true,
  --   cmd = {'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'},
  --   config = function()
  --     vim.g.db_ui_save_location = '~/.config/nvim/db_ui_history'
  --     vim.g.db_ui_use_nerd_fonts = 1
  --     vim.g.db_ui_win_position = 'left'
  --     vim.g.db_ui_winwidth = 35
  --     vim.g.db_ui_use_nerd_fonts = 1
  --     vim.g.db_ui_table_helpers = {
  --       postgres = {
  --         primary_key = 'id',
  --         foreign_key = 'id',
  --         join_string = '->',
  --         delete_cascade = 'cascade',
  --         delete_restrict = 'restrict',
  --         delete_set_null = 'set null',
  --         delete_set_default = 'set default',
  --       },
  --     }
  --   end
  -- },
  -- {
  --   'kristijanhusak/vim-dadbod-completion',
  --   requires = {'tpope/vim-dadbod'},
  --   opt = true,
  --   ft = {'sql'},
  --   config = function()
  --     vim.g.dbs = {
  --       ['*'] = {
  --         ['driver'] = 'sqlite',
  --         ['database'] = 'db.sqlite3',
  --       },
  --       ['sqlite'] = {
  --         ['driver'] = 'sqlite',
  --         ['database'] = 'db.sqlite3',
  --       },
  --       ['postgres'] = {
  --         ['driver'] = 'postgres',
  --         ['database'] = 'postgres',
  --         ['host'] = 'localhost',
  --         ['port'] = 5432,
  --         ['username'] = 'postgres',
  --         ['password'] = 'postgres',
  --       },
  --     }
  --   end
  -- },
  -- {
  --   'kristijanhusak/vim-dadbod-syntax',
  --   requires = {'tpope/vim-dadbod'},
  --   opt = true,
  --   ft = {'sql'},
  -- },
  --
  -- {
  --   'kristijanhusak/vim-dadbod-ui',
  --   requires = {'tpope/vim-dadbod'},
  --   opt = true,
  --   cmd = {'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'},
  --   config = function()
  --     vim.g.db_ui_save_location = '~/.config/nvim/db_ui_history'
  --   end
  -- },
}
