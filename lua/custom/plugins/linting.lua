return { 'mfussenegger/nvim-lint' }

-- Configuration for nvim-lint, a code linter that acts in concert with Neovim's
-- built-in LSP client.
--return {}
-- Set linters by filetype
-- return {'mfussenegger/nvim-lint'}
-- require('lint').linters_by_ft = {
--   ansible = {"ansible_lint"},
--   bash = {"shellcheck"},
--   c = {"cppcheck"},
--   clojure = {"clj-kondo"},
--   cmake = {"cmakelint"},
--   cpp = {"cppcheck"},
--   dockerfile = {"hadolint"},
--   go = {"revive"},
--   haskell = {"hlint"},
--   html = {"tidy"},
--   java = {"checkstyle"},
--   javascript = {"eslint"},
--   javascriptreact = {"eslint"},
--   --lua = {"selene"},
--   markdown = {"markdownlint"},
--   python = {"pylint"},--{"mypy"},--{"pydocstyle"},
--   ruby = {"ruby"},
--   sh = {"shellcheck"},
--   tex = {"chktex"},
--   vim = {"vint"},
--   yaml = {"yamllint"},
--   zsh = {"shellcheck"}
-- }
--
-- -- Set up autocmd to trigger linting
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

-- vim:foldenable:foldmethod=marker:foldlevel=0

