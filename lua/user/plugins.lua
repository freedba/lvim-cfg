lvim.plugins = {
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("user.rust_tools").config()
    end,
    ft = { "rust", "rs" }
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      -- require('symbols-outline').setup()
      require("user.symbols-outline").config()
    end,
  },
  -- {
  --   "tamago324/lir.nvim",
  --   config = function()
  --     require("user.lir").config()
  --   end,
  -- },
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   config = function()
  --     require("user.colorizer").config()
  --   end,
  -- },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    'crispgm/nvim-go',
    'rcarriga/nvim-notify',
    config = function()
      -- require("user.nvim-go").config()
      require('lspconfig').gopls.setup({})
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "LspAttach",
  --   config = function()
  --     require("lspsaga").setup({})
  --   end,
  --   dependencies = {
  --     { "nvim-tree/nvim-web-devicons" },
  --     --Please make sure you install markdown and markdown_inline parser
  --     { "nvim-treesitter/nvim-treesitter" }
  --   }
  -- },
  {
    'kdheepak/lazygit.nvim',
  },
  -- {
  -- "phaazon/hop.nvim",
  -- event = "BufRead",
  -- config = function()
  -- require("hop").setup()
  -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
  -- end,
  -- },
  -- {
  --   "ggandor/lightspeed.nvim",
  --   event = "BufRead",
  -- },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
    event = "BufRead",
  },
  -- {
  --   "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd "highlight default link gitblame SpecialComment"
  --     vim.g.gitblame_enabled = 1
  --   end,
  -- },
  {
    "cuducos/yaml.nvim",
  },
  {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup()
    end
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "Mofiqul/vscode.nvim",
  },
  {
    "dr4vs/neon.nvim"
  },
  {
    'tiagovla/tokyodark.nvim'
  },
  {
    "lunarvim/horizon.nvim",
  },
  {
    'martinsione/darkplus.nvim',
  },
  {
    'rmehri01/onenord.nvim'
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      require("user.neo-tree").config()
    }
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "1.*",
    require("user.nvim-window-picker").config()
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    build = "make",
    event = "BufRead",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" },
    -- run = "yay -S glow"
    config = function()
      require("glow").setup {
        glow_path = "/usr/local/bin/glow",
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  { "oberblastmeister/neuron.nvim" },
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
}
