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
    lazy = true, config = function()
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

  {
    "ggandor/leap.nvim",
  },

  {
  "norcalli/nvim-colorizer.lua",
    {
      "norcalli/nvim-terminal.lua",
      config = function()
        require("terminal").setup()
      end,
    },
  },

  {
  "norcalli/nvim-colorizer.lua",
  },

  {
  'code-biscuits/nvim-biscuits',
  requires = {
    'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
  },
    setup = {
      cursor_line_only = true
    },
  },

  -- nvim inside of chrome
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    -- lazy = not vim.g.started_by_firenvim,
    build = function()
        vim.fn["firenvim#install"](0)
    end
},

  -- for fast and smooth scrolling
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  },

  -- align text
  -- {
  --   'junegunn/vim-easy-align',
  --   keys = {
  --     {'x', 'ga'},
  --     {'n', 'ga'},
  --   },
  -- },
  {
    "godlygeek/tabular",
  },

  -- manage you files
  {
    'nvim-lua/plenary.nvim',
    'ThePrimeagen/harpoon'
  }

}
