return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function()
    if vim.g.started_by_firenvim ~= true then
    require("barbecue").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end
  end

  -- opts = function ()
  --   if vim.g.started_by_firenvim ~= true then
  --   require'bufferline'.setup{
  --     }
  --   end
  -- end,
}
