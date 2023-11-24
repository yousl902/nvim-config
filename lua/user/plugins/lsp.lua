return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = { 'mason-lspconfig.nvim', 'nlsp-settings.nvim' },
    config = function()
      require 'user.configs.lsp'
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    cmd = { 'LspInstall', 'LspUninstall' },
    config = function()
      require('mason-lspconfig').setup {
        insure_installed = {
          'lua-language-server',
          'tsserver',
          'json-lsp',
          'tailwindcss-language-server',
          'unocss-language-server',
          'typescript-language-server',
          'clangd',
          'pyright',
        },
      }

      -- automatic_installation is handled by lsp-manager
      local settings = require 'mason-lspconfig.settings'
      settings.current.automatic_installation = false
    end,
    lazy = true,
    event = 'User FileOpened',
    dependencies = 'mason.nvim',
  },
  { 'tamago324/nlsp-settings.nvim', cmd = 'LspSettings', lazy = true },
  { 'jose-elias-alvarez/null-ls.nvim', lazy = true },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
	ui = {
	  icons = {
	      package_installed = "✓",
	      package_pending = "➜",
	      package_uninstalled = "✗"
	  },
		      border = {
			style = "rounded",
			highlight = "FloatBorder",
			text_highlight = "FloatBorder",
			width = 1,
			color = "FloatBorder",
		      },
	},
      })
    end,
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
    build = function()
      pcall(function()
        require('mason-registry').refresh()
      end)
    end,
    event = 'User FileOpened',
    lazy = true,
  },
  -- Rust
  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function(_, opts)
      local crates = require 'crates'
      crates.setup(opts)
      require('cmp').setup.buffer {
        sources = { { name = 'crates' } },
      }
      crates.show()
    end,
  },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   -- init = function ()
  --   --   vim.g.rustfmt_autosave = 1
  --   -- end
  -- },
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    dependencies = 'neovim/nvim-lspconfig',
    -- opts = function ()
    --   return require "custom.configs.rust-tools"
    -- end,
    -- config = function(_, opts)
    --   require('rust-tools').setup(opts)
    -- end
    config = function()
      require('rust-tools').setup()
    end,
  },
  -- show lsp meta data when lsp attached
  -- {
  --   "j-hui/fidget.nvim",
  --   tag = "legacy",
  --   event = "LspAttach",
  --   opts = {
  --     -- options
  --   },
  -- },
  {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  -- Python
  {
    'ChristianChiarulli/swenv.nvim',
    'stevearc/dressing.nvim',
    'mfussenegger/nvim-dap-python',
    'nvim-neotest/neotest',
    'nvim-neotest/neotest-python',
  },

  -- C++
  {
    'p00f/clangd_extensions.nvim',
  },

  -- Java
  {
    'mfussenegger/nvim-jdtls',
  },

  -- May should be in another file
  -- formatting
  {
    'stevearc/conform.nvim',
    -- event = { "BufWritePre" },
    event = { 'BufRead' },
    cmd = { 'ConformInfo' },
    -- opts = {
    --   format_on_save = true,
    -- },
    config = function()
      require 'user.configs.conform'
    end,
  },

  -- --linting
  {
    'mfussenegger/nvim-lint',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require 'user.configs.linting'
    end,
  },
}
