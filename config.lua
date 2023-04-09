--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
require "user.plugins"

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "tokyonight"
-- -- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "horizon"
-- lvim.colorscheme = "darkplus"
-- lvim.colorscheme = "onenord"
-- lvim.colorscheme = "kanagawa" -- 暗色主题
lvim.colorscheme = "neon" -- 霓虹色主题
-- lvim.colorscheme = "tokyodark" -- 东京主题
-- lvim.colorscheme = "vscode" -- vscode主题
--
-- For dark theme (neovim's default)
-- vim.o.background = 'dark'
-- For light theme
-- vim.o.background = 'light'
--
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

lvim.builtin.which_key.mappings["t"] = { "<cmd>ToggleTerm<CR>", "term" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.lualine.style = "default" -- or "none" "lvim"
lvim.builtin.lualine.sections.lualine_c = { "filename" }
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 5000 }
  end,
  "Format",
}


-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom["3"] = "\\.git$"
lvim.builtin.nvimtree.setup.auto_reload_on_write = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "go",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "flake8",
    extra_args = { "--max-line-length", 100 },
    filetypes = { "python" },
  },
  {
    --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- vim.g.go_list_type = "quickfix"
-- vim.g.go_fmt_fail_silently = 1
-- vim.g.go_metalinter_autosave = 0
-- vim.g.go_metalinter_autosave_enabled = ''

vim.opt.mouse = "r"
vim.opt.autowriteall = true
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
lvim.keys.normal_mode["<S-m>"] = ":BufferLinePick<CR>"
-- vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
lvim.builtin.which_key.mappings["a"] = { "<cmd>AerialToggle<CR>", "AerialToggle" }

-- copilot set
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

vim.api.nvim_create_autocmd(
  "BufReadPost",
  {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
  }
)

-- set neo-tree
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle reveal_force_cwd<CR>", "NeoTree" }
lvim.builtin.which_key.mappings["b"] = { "<cmd>Neotree toggle show buffers right<CR>", "NeoTree show buffers right" }
lvim.builtin.which_key.mappings["s"] = { "<cmd>Neotree float git_status<CR>", "NeoTree git_status" }


-- set window-picker
-- example mappings you can place in some other place
-- An awesome method to jump to windows
local picker = require('window-picker')

vim.keymap.set("n", ",w", function()
  local picked_window_id = picker.pick_window({
        include_current_win = true
      }) or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

-- Swap two windows using the awesome window picker
local function swap_windows()
  local window = picker.pick_window({
    include_current_win = false
  })
  local target_buffer = vim.fn.winbufnr(window)
  -- Set the target window to contain current buffer
  vim.api.nvim_win_set_buf(window, 0)
  -- Set current window to contain target buffer
  vim.api.nvim_win_set_buf(0, target_buffer)
end
vim.keymap.set('n', ',W', swap_windows, { desc = 'Swap windows' })

-- set symbols-outline
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline" }

-- set Persistence
lvim.builtin.which_key.mappings["j"] = {
  name = "persistence",
  s = { "<cmd>lua require('persistence').load()<CR>", "persistence load" },
  l = { "<cmd>lua require('persistence').load({ last = true })<CR>", "persistence load last" },
}

-- set vim-matchup
lvim.builtin.treesitter.matchup.enable = true

-- set trouble
lvim.builtin.which_key.mappings["x"] = {
  name = "Trouble",
  x = { "<cmd>TroubleToggle<CR>", "TroubleToggle" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "TroubleToggle workspace_diagnostics" },
  d = { "<cmd>TroubleToggle document_diagnostics<CR>", "TroubleToggle document_diagnostics" },
  l = { "<cmd>TroubleToggle loclist<CR>", "TroubleToggle loclist" },
  q = { "<cmd>TroubleToggle quickfix<CR>", "TroubleToggle quickfix" },
  g = { "<cmd>TroubleToggle lsp_references<CR>", "TroubleToggle lsp_references" },
}
