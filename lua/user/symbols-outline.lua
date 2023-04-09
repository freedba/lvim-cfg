local M = {}

M.config = function()
  local status_ok, symbols = pcall(require, "symbols-outline")
  if not status_ok then
    return
  end
  local cfg = {
  }
  symbols.setup(cfg)
end

return M
