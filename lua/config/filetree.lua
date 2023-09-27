local open_nvim_tree = function()
  require("neo-tree.command").execute({ toggle = true, position = "left", dir = require("custom.util").get_root() })
end

-- if vim.g.started_by_firenvim ~= true then
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- end
