local M = {}
---Pre-hook, called before commenting the line
---@type function|nil
M.pre_hook = function(...)
  local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
  if loaded and ts_comment then
    return ts_comment.create_pre_hook()(...)
  end
end

return M
