vim.cmd([[colorscheme codedark]])
--
-- bracket colors
vim.cmd([[TSToggle rainbow]])
vim.cmd('hi rainbowcol1 guifg=#fcba03')
vim.cmd('hi rainbowcol2 guifg=#ae5cb2')
vim.cmd('hi rainbowcol3 guifg=#1a6aad')
vim.cmd('hi rainbowcol4 guifg=#fcba03')
vim.cmd('hi rainbowcol5 guifg=#ae5cb2')
vim.cmd('hi rainbowcol6 guifg=#1a6aad')
vim.cmd('hi rainbowcol7 guifg=#fcba03')

require('nvim-biscuits').setup({
  cursor_line_only = true
})


require'colorizer'.setup()

-- local parser = vim.treesitter.get_parser(0, "html")
-- local query = vim.treesitter.query.get_query("html", "rainbow")
--
-- for id, node in query:iter_captures(parser:parse()[1]:root(), 0) do
--   local capture_name = query.captures[id]
--   if string.match(capture_name, "tag") then
--     query:dissect_capture(id)
--   end
-- end
