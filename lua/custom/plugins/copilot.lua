return {
  'github/copilot.vim',

  config = function ()
    vim.g.copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node"
  end
}
-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   build = ":Copilot auth",
--   opts = {
--     suggestion = { enabled = true },
--     panel = { enabled = false },
--     filetypes = {
--       markdown = true,
--       help = true,
--     },
--   },
-- }
-- return { "zbirenbaum/copilot.lua",
--     event = { "VimEnter" },
--     config = function()
--       vim.defer_fn(function()
--         require("copilot").setup {
--           plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
--         }
--       end, 100)
--     end,
--   }
--
-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({})
--   end,
-- }
