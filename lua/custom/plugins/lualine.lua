-- return {
--   -- Set lualine as statusline
--   'nvim-lualine/lualine.nvim',
--   -- See `:help lualine.txt`
--   opts = {
--     options = {
--       icons_enabled = false,
--       theme = 'onedark',
--       component_separators = '|',
--       section_separators = '',
--     },
--   },
-- }
--
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    float = true,
    separator = "bubble", -- bubble | triangle
    ---@type any
    colorful = true,
  },
  config = function(_, opts)
    if vim.g.started_by_firenvim ~= true then
    local lualine_config = require("config.lualine")
    lualine_config.setup(opts)
    lualine_config.load()
  end
  end,
}

