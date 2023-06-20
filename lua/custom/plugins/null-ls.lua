-- -- import null-ls plugin safely
return {
    -- formatting & linting
  "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

  config = function()
		local null_ls = require("null-ls")
		return {
    		-- setup formatters & linters
		sources = {
			--  to disable file types use
			--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
      --                
			null_ls.builtins.formatting.prettier, -- js/ts formatter
		        null_ls.builtins.formattig.stylua, -- lua formatter
			null_ls.builtins.diagnostics.eslint_d.with({ -- js/ts linter
				-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
				condition = function(utils)
					return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
				end,
			}),
			-- flake8
			null_ls.builtins.diagnostics.flake8,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.builtins.code_actions.shellcheck
		},
		-- configure format on save
		on_attach = function(current_client, bufnr)
			if current_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = vim.api.nvim_create_augroup("LspFormatting", {}), buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("LspFormatting", {}),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								--  only use null-ls for formatting instead of lsp server
								return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end,
		}
	end
}

--
-- -- for conciseness
-- local formatting = null_ls.builtins.formatting -- to setup formatters
-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters
--
-- -- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- -- configure null_ls
-- null_ls.setup({
--   -- setup formatters & linters
--   sources = {
--     --  to disable file types use
--     --  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
--     formatting.prettier, -- js/ts formatter
--     formatting.stylua, -- lua formatter
--     diagnostics.eslint_d.with({ -- js/ts linter
--       -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
--       condition = function(utils)
--         return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
--       end,
--     }),
--     -- flake8
--     diagnostics.flake8,
--     diagnostics.shellcheck,
--     null_ls.builtins.code_actions.shellcheck
--   },
--   -- configure format on save
--   on_attach = function(current_client, bufnr)
--     if current_client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({
--             filter = function(client)
--               --  only use null-ls for formatting instead of lsp server
--               return client.name == "null-ls"
--             end,
--             bufnr = bufnr,
--           })
--         end,
--       })
--     end
--   end,
-- })
