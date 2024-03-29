local M = {}
M.config = function()
  local status_ok, picker = pcall(require, "window-picker")
  if not status_ok then
    return
  end
  local cfg = {
    autoselect_one = true,
    include_current = false,
    filter_rules = {
      -- filter using buffer options
      bo = {
        -- if the file type is one of following, the window will be ignored
        filetype = { "neo-tree-popup", "notify", "quickfix" },
        -- if the buffer type is one of following, the window will be ignored
        buftype = { "terminal" },
      },
    },
    other_win_hl_color = "#e35e4f",
  }
  picker.setup(cfg)
end

return M
