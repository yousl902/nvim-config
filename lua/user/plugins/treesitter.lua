return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- run = ":TSUpdate",
    config = function()
      -- local utils = require "lvim.utils"
      -- local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
      -- vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          -- "black",
          'c',
          'html',
          'lua',
          'luadoc',
          'luap',
          'markdown',
          'markdown_inline',
          'python',
          'query',
          'regex',
          'tsx',
          'vim',
          'vimdoc',
          'java',
          'yaml',
          'json',
          'javascript',
          'typescript',
          'tsx',
          'sql',
          'css',
          'svelte',
          'gitignore',
        },
      }
    end,
    cmd = {
      'TSInstall',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync',
      'TSInstallInfo',
      'TSInstallSync',
      'TSInstallFromGrammar',
    },
    event = 'User FileOpened',
  },
  {
    -- You'll also get <a-n> and <a-p> as keymaps to move between references and <a-i> as a
    -- textobject for the reference illuminated under the cursor.
    'https://github.com/RRethy/vim-illuminate',
  },
  -- view treesitter info
  {
    'nvim-treesitter/playground',
    event = 'BufRead',
  },
}
