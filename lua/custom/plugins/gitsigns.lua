  return {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
    end,
  },
}


  -- {
  --   "lewis6991/gitsigns.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {
  --     signs = {
  --       add = { text = Icons.gitsigns.add },
  --       change = { text = Icons.gitsigns.change },
  --       delete = { text = Icons.gitsigns.delete },
  --       topdelhfe = { text = Icons.gitsigns.topdelhfe },
  --       changedelete = { text = Icons.gitsigns.changedelete },
  --       untracked = { text = Icons.gitsigns.untracked },
  --     },
  --     current_line_blame = true,
  --     current_line_blame_opts = {
  --       delay = 300,
  --     },
  --     current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  --     preview_config = {
  --       border = Util.generate_borderchars("thick", "tl-t-tr-r-bl-b-br-l"), -- [ top top top - right - bottom bottom bottom - left ]
  --     },
  --   },
  --   keys = {
  --     { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
  --     { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
  --     { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
  --     { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  --     { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
  --     { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  --     { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  --     { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  --     { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  --     { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
  --   },
  -- },
  --

