vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function(ev)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  end
})

-- nvim-tree keymaps
-- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
-- vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>')
-- vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>')

-- move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move current line / block of text in normal mode, cursor position unchanged
vim.keymap.set("n", "J", "mzJ`z")

-- move cursor up/down 24 lines 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- when searching, keep cursor position centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over selected text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- tabline keymaps
vim.keymap.set('n', 'tn', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', 'tp', ':BufferLineMovePrev<CR>')

--run current file
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })

-- highlight keymaps
vim.keymap.set('n', 'rn', require('illuminate').goto_next_reference, { desc = "Move to next reference" })
vim.keymap.set('n', 'rp', require('illuminate').goto_prev_reference, { desc = "Move to previous reference" })

-- move to next/prev empty line in visual mode
vim.keymap.set("n", "vu", "v}")
vim.keymap.set("n", "vi", "v{")

-- TODO fix this
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- replace the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- trouble
-- Lua
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", {desc = "Trouble references"},
  {silent = true, noremap = true}
)

-- leap
vim.keymap.set("n", "b", "<Plug>(leap-forward-to)", {desc = "Leap Forward"})
vim.keymap.set("n", "B", "<Plug>(leap-backward-to)", {desc = "Leap Backward"})

-- harpoon
vim.keymap.set("n", "<leader>fa", ":lua require('harpoon.mark').add_file()<cr>", {desc = "Harpoon Add File"})
vim.keymap.set("n", "<leader>fm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc = "Harpoon Menu"})
vim.keymap.set("n", "<leader>f1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", {desc = "Harpoon Terminal 1"})
vim.keymap.set("n", "<leader>f2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", {desc = "Harpoon Terminal 2"})
vim.keymap.set("n", "<leader>f3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", {desc = "Harpoon Terminal 3"})
vim.keymap.set("n", "<leader>f4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", {desc = "Harpoon Terminal 4"})
vim.keymap.set("n", "<leader>fn", "<cmd>lua require('harpoon.ui').nav_next() <cr>", {desc = "Harpoon next"})
vim.keymap.set("n", "<leader>fp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", {desc = "Harpoon prev"})

-- Todo-comments
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", {desc = "Todo Telescope"})
