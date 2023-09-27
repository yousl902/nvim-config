-- dont toggle neo tree, lualine and bufferline when opening a file in firenvim
-- if vim.g.started_by_firenvim == true then
--   -- require("neo-tree.command").execute({ toggle = false})
--   require('lualine').hide({
--     place = {'statusline', 'tabline', 'winbar'}, -- The segment this change applies to.
--     unhide = false,  -- whether to re-enable lualine again/
--   })
--   require("bufferline").disable()
-- end

vim.g.firenvim_config.localSettings['.*'] = { selector = 'textarea' }
