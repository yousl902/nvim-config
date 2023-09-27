--
-- return {
--     -- Autocompletion
--     'hrsh7th/nvim-cmp',
--     dependencies = {
--       -- Snippet Engine & its associated nvim-cmp source
--       'L3MON4D3/LuaSnip',
--       'saadparwaiz1/cmp_luasnip',
--
--       -- Adds LSP completion capabilities
--       'hrsh7th/cmp-nvim-lsp',
--
--       -- Adds a number of user-friendly snippets
--       'rafamadriz/friendly-snippets',
--     },
--     config = function()
--       local cmp = require 'cmp'
--       local luasnip = require 'luasnip'
--       require('luasnip.loaders.from_vscode').lazy_load()
--       luasnip.config.setup {}
--
--       cmp.setup {
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--         mapping = cmp.mapping.preset.insert {
--           ['<C-n>'] = cmp.mapping.select_next_item(),
--           ['<C-p>'] = cmp.mapping.select_prev_item(),
--           ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--           ['<C-f>'] = cmp.mapping.scroll_docs(4),
--           ['<C-Space>'] = cmp.mapping.complete {},
--           ['<CR>'] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--           },
--           ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             elseif luasnip.expand_or_locally_jumpable() then
--               luasnip.expand_or_jump()
--             else
--               fallback()
--             end
--           end, { 'i', 's' }),
--           ['<S-Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             elseif luasnip.locally_jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, { 'i', 's' }),
--         },
--         sources = {
--           { name = 'nvim_lsp' },
--           { name = 'luasnip' },
--         },
--       }
--   end,
-- }

-- Autocompletion
return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			-- react snippets
			'SirVer/ultisnips',
			'honza/vim-snippets',
			'mlaursen/vim-react-snippets',
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip/loaders/from_vscode").lazy_load()

			local kind_icons = {
				Text = "",
				Method = "m",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					--["<Tab>"] = cmp.mapping(function(fallback)
                                          --      fallback()
                                            --    end),
					-- 	if cmp.visible() then
					-- 		cmp.select_next_item()
					-- 	elseif luasnip.expand_or_jumpable() then
					-- 		luasnip.expand_or_jump()
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
                                                fallback()
                                                end),
					-- 	if cmp.visible() then
					-- 		cmp.select_prev_item()
					-- 	elseif luasnip.jumpable(-1) then
					-- 		luasnip.jump(-1)
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
-- 			cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--     ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--     ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--     ["<CR>"] = cmp.mapping.confirm({ select = false }),
--   }),
--   -- sources for autocompletion
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" }, -- lsp
--     { name = "luasnip" }, -- snippets
--     { name = "buffer" }, -- text within current buffer
--     { name = "path" }, -- file system paths
--   }),
--   -- configure lspkind for vs-code like icons
--   formatting = {
--     format = require("lspkind").cmp_format({
--       maxwidth = 50,
--       ellipsis_char = "...",
--     }),
--   },
-- })
		end,
	},
}
-- [[ Configure nvim-cmp ]]
-- See `:help cmp`



