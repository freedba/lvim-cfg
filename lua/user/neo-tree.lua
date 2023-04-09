local M = {}
M.config = function()
  local status_ok, neo = pcall(require, "neo-tree")
  if not status_ok then
    return
  end
  local cfg = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    sort_case_insensitive = true,
    window = {
      width = 40,
    },
    buffers = {
      follow_current_file = true,
    },
    filesystem = {
      follow_current_file = true,
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules"
        },
        always_show = {
          ".gitignore",
          ".gitlab-ci.yml"
        },
        never_show = {
          ".DS_Store",
          "thumbs.db"
        },
      },
    },
  }
  neo.setup(cfg)
end

return M
