local M = {}
local components = require "user.configs.lualine.components"

local setup = {
  -- style = "lvim",
  options = {
    theme = "auto",
    globalstatus = true,
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    -- disabled_filetypes = { "alpha" },
  },
  sections = {
    -- lualine_a = {
    --   components.mode,
    -- },
    lualine_b = {
      components.branch,
    },
    lualine_c = {
      components.diff,
      components.python_env,
    },
    lualine_x = {
      components.diagnostics,
      components.lsp,
      components.spaces,
      components.filetype,
    },
    lualine_y = { components.location },
    lualine_z = {
      components.progress,
    },
  },
  inactive_sections = {
    lualine_a = {
      components.mode,
    },
    lualine_b = {
      components.branch,
    },
    lualine_c = {
      components.diff,
      components.python_env,
    },
    lualine_x = {
      components.diagnostics,
      components.lsp,
      components.spaces,
      components.filetype,
    },
    lualine_y = { components.location },
    lualine_z = {
      components.progress,
    },
  },
  tabline = {},
  extensions = {},
}
--   active = true,
--   style = "lvim",
--   options = {
--     icons_enabled = nil,
--     component_separators = nil,
--     section_separators = nil,
--     theme = "lunar",
--     disabled_filetypes = { statusline = { "alpha" } },
--     globalstatus = true,
--   },
--   sections = {
--     lualine_a = nil,
--     lualine_b = nil,
--     lualine_c = nil,
--     lualine_x = nil,
--     lualine_y = nil,
--     lualine_z = nil,
--   },
--   inactive_sections = {
--     lualine_a = nil,
--     lualine_b = nil,
--     lualine_c = nil,
--     lualine_x = nil,
--     lualine_y = nil,
--     lualine_z = nil,
--   },
--   tabline = nil,
--   extensions = nil,
--   on_config_done = nil,
-- }

M.setup = function()
  -- if #vim.api.nvim_list_uis() == 0 then
  --   local Log = require "lvim.core.log"
  --   Log:debug "headless mode detected, skipping running setup for lualine"
  --   return
  -- end

  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  -- require("user.configs.lualine.styles").update()

  lualine.setup(setup)

  -- if lvim.builtin.lualine.on_config_done then
  --   lvim.builtin.lualine.on_config_done(lualine)
  -- end
end

return M
