-- return {
--   'nvim-tree/nvim-tree.lua',
--   dependencies = {
--     'nvim-tree/nvim-web-devicons', -- optional
--   },
--   config = function()
--     require("nvim-tree").setup {
--       -- change folder arrow icons
--       renderer = {
--         icons = {
--           glyphs = {
--             folder = {
--               arrow_closed = "", -- arrow when folder is closed
--               arrow_open = "", -- arrow when folder is open
--             },
--           },
--         },
--       },
--       -- disable window_picker for
--       -- explorer to work well with
--       -- window splits
--       actions = {
--         open_file = {
--           window_picker = {
--             enable = false,
--           },
--         },
--       },
--     }
--   -- change color for arrows in tree to light blue
--     vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
--   end,
-- }
--#region

  return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = "mrbjarksen/neo-tree-diagnostics.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "left", dir = require("custom.util").get_root() })
        end,
        desc = "Explorer (root dir)",
        remap = true,
      },
    },
    opts = require("config.neo-tree"),
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
          vim.cmd([[set showtabline=0]])
        end
      end
    end,
  }

