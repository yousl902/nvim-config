local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- TODO: configure neotest and the key mappings for python
-- -- setup testing
-- require("neotest").setup({
--   adapters = {
--     require("neotest-python")({
--       -- Extra arguments for nvim-dap configuration
--       -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
--       dap = {
--         justMyCode = false,
--         console = "integratedTerminal",
--       },
--       args = { "--log-level", "DEBUG", "--quiet" },
--       runner = "pytest",
--     })
--   }
-- })

-- which_key["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
--   "Test Method" }
-- which_key["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
--   "Test Method DAP" }
-- which_key["df"] = {
--   "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
-- which_key["dF"] = {
--   "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
-- which_key["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- -- binding for switching
-- which_key["C"] = {
--   name = "Python",
--   c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
-- }
