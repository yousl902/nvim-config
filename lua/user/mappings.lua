local key = vim.keymap
local generic_opts_any = { noremap = true, silent = true }

key.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
key.set('n', '<leader>Q', '<cmd>qa<CR>', { desc = 'Quit all' })
key.set({'n', 'v'}, '<Tab>', '>gv', generic_opts_any)
key.set({'n', 'v'}, '<S-Tab>', '<gv', generic_opts_any)

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- move current line / block of text in normal mode, cursor position unchanged
vim.keymap.set('n', 'J', 'mzJ`z')

-- move cursor up/down 24 lines
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- when searching, keep cursor position centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- paste over selected text
vim.keymap.set('x', '<leader>p', [["_dP]])

-- tabline keymaps
-- vim.keymap.set('n', 'tn', ':BufferLineMoveNext<CR>')
-- vim.keymap.set('n', 'tp', ':BufferLineMovePrev<CR>')

--run current file
vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })

-- highlight keymaps
vim.keymap.set('n', 'rn', require('illuminate').goto_next_reference, { desc = 'Move to next reference' })
vim.keymap.set('n', 'rp', require('illuminate').goto_prev_reference, { desc = 'Move to previous reference' })

-- move to next/prev empty line in visual mode
vim.keymap.set('n', 'vu', 'v}', { desc = 'Move to next empty line in Visual mode' })
vim.keymap.set('n', 'vi', 'v{', { desc = 'Move to previous empty line in Visual mode' })

-- replace the word under the cursor
vim.keymap.set('n', '<leader>a', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
{ desc = 'Replace all ocurrencesof the word under cursor' })

-- make a file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Better window movement
key.set('n', '<C-h>', '<C-w>h', { desc = 'Move Left' })
key.set('n', '<C-j>', '<C-w>j', { desc = 'Move Down' })
key.set('n', '<C-k>', '<C-w>k', { desc = 'Move Up' })
key.set('n', '<C-l>', '<C-w>l', { desc = 'Move Right' })

-- Resize with arrows
key.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize Up' })
key.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize Down' })
key.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize Left' })
key.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize Right' })

-- leap
key.set('n', 't', '<Plug>(leap-forward-to)', { desc = 'Leap Forward' })
key.set('n', 'T', '<Plug>(leap-backward-to)', { desc = 'Leap Backward' })

-- debugprint
key.set("n", "<Leader>dp", function()
    -- Note: setting `expr=true` and returning the value are essential
    return require('debugprint').debugprint()
end, {
    expr = true,
    desc = 'Debug print'
})
key.set("n", "<Leader>dv", function()
    -- Note: setting `expr=true` and returning the value are essential
    return require('debugprint').debugprint({ variable = true })
end, {
    expr = true,
    desc = 'Debug print variable'
})

key.set("n", "<Leader>do", function()
    -- Note: setting `expr=true` and returning the value are essential
    -- It's also important to use motion = true for operator-pending motions
    return require('debugprint').debugprint({ motion = true })
end, {
    expr = true,
    desc = 'Debug print operator'
})
key.set('n', '<leader>dd', '<cmd>DeleteDebugPrints<CR>', { desc = 'delete debug prints' })

-- TODO: Move these to the lsp config, they be available only if lsp is active
--lsp
key.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Show hover' })
key.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Goto definition' })
key.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = 'Goto Declaration' })
key.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'Goto references' })
key.set('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = 'Goto Implementation' })
key.set('n', 'gs', '<cmd>lua vim.lsp.uf.signature_help()<cr>', { desc = 'Show signature help' })
key.set('n', 'gl', function()
  local float = vim.diagnostic.config().float
  if float then
    local config = type(float) == 'table' and float or {}
    config.scope = 'line'
    vim.diagnostic.open_float(config)
  end
end, { desc = 'Show line diagnostics' })

-- --typescript_tools
-- --   n = {
-- which_key["tfa"] = { "<cmd>TSToolsFixAll<CR>", "fix all" }
-- which_key["tam"] = { "<cmd>TSToolsAddMissingImports<CR>", "add missing imports" }
-- which_key["tru"] = { "<cmd>TSToolsRemoveUnused<CR>", "remove unsed" }
-- which_key["tri"] = { "<cmd>TSToolsRemoveUnusedImports<CR>", "remove unsed imports" }
-- which_key["tsi"] = { "<cmd>TSToolsSortImports<CR>", "sort imports" }
-- which_key["toi"] = { "<cmd>TSToolsOrganizeImports<CR>", "orginize imports" }
-- which_key["tgd"] = { "<cmd>TSToolsGoToSourceDefinition<CR>", "go definition" }
