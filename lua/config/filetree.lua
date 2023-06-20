-- open nvim-tree on setup
-- local function open_nvim_tree(data)
--   -- buffer is a [No Name]
--   local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--
--   -- buffer is a directory
--   local directory = vim.fn.isdirectory(data.file) == 1
--
--   if not no_name and not directory then
--     return
--   end
--
--   -- change to the directory
--   if directory then
--     vim.cmd.cd(data.file)
--   end
--
--   -- open the tree
--   require("nvim-tree.api").tree.open()
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- 
--
-- call this function "        function()
--          
--        end,
--" to open the tree 

local open_nvim_tree = function()
  require("neo-tree.command").execute({ toggle = true, position = "left", dir = require("custom.util").get_root() })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
