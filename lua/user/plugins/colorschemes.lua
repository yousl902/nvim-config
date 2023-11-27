return {
  -- NOTE: if I want to create my own colortheme some time
  --   {
  --   "rktjmp/lush.nvim",
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = not vim.startswith(lvim.colorscheme, "tokyonight"),
  -- },
  {
    'lunarvim/lunar.nvim',
    -- lazy = lvim.colorscheme ~= "lunar",
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'rebelot/kanagawa.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'rmehri01/onenord.nvim' },
  { 'navarasu/onedark.nvim' },
  {'marko-cerovac/material.nvim'},
}
