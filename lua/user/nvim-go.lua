local M = {}
M.config = function()
  local status_ok, go = pcall(require, "nvim-go")
  if not status_ok then
    return
  end
  local cfg = {
    -- notify: use nvim-notify
    notify = false,
    -- auto commands
    auto_format = true,
    auto_lint = true,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = 'revive',
    -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
    linter_flags = {},
    -- lint_prompt_style: qf (quickfix), vt (virtual text)
    lint_prompt_style = 'qf',
    -- formatter: goimports, gofmt, gofumpt, lsp
    formatter = 'goimports',
    -- maintain cursor position after formatting loaded buffer
    maintain_cursor_pos = false,
    -- test flags: -count=1 will disable cache
    test_flags = { '-v' },
    test_timeout = '30s',
    test_env = {},
    -- show test result with popup window
    test_popup = false,
    test_popup_auto_leave = false,
    test_popup_width = 80,
    test_popup_height = 10,
    -- test open
    test_open_cmd = 'edit',
    -- struct tags
    tags_name = 'json',
    tags_options = { 'json=omitempty' },
    tags_transform = 'snakecase',
    tags_flags = { '-skip-unexported' },
    -- quick type
    quick_type_flags = { '--just-types' },
  }
  go.setup(cfg)
  -- vim.api.nvim_command("augroup NvimGo")
  -- vim.api.nvim_command("autocmd!")
  -- vim.api.nvim_command("autocmd User NvimGoLintPopupPost wincmd p")
  -- vim.api.nvim_command("augroup END")
end

return M
