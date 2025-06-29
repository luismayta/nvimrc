return {
  -- Core UI and Themes
  { "NvChad/nvterm", enabled = false }, -- Disabled plugin

  { import = "plugins.spec.theme" },
  { import = "plugins.spec.ccc" },
  -- AI and Coding Assistance
  { import = "plugins.spec.ai" },

  -- -- lsp
  { import = "plugins.spec.mason" },
  -- TOOLS
  { import = "plugins.spec.asynctasks" },
  { import = "plugins.spec.trouble" },
  { import = "plugins.spec.b64" },
  { import = "plugins.spec.dap-ui" },
  { import = "plugins.spec.dap-virtual-text" },
  { import = "plugins.spec.diffview" },
  { import = "plugins.spec.ui" },
  { import = "plugins.spec.fine-cmdline" },
  -- Git
  { import = "plugins.spec.git" },

  -- productivity
  { import = "plugins.spec.productivity" },

  -- navigation

  { import = "plugins.spec.goto-preview" },
  { import = "plugins.spec.grug-far" },
  { import = "plugins.spec.hover" },
  { import = "plugins.spec.matchup" },
  { import = "plugins.spec.neocomposer" },
  { import = "plugins.spec.notify" },
  { import = "plugins.spec.outline" },
  { import = "plugins.spec.focus" },
  { import = "plugins.spec.regexplainer" },
  -- Languages
  --
  -- others
  { import = "plugins.spec.gleam" },

  -- python
  { import = "plugins.spec.python" },
  -- rust

  { import = "plugins.spec.rust" },
  -- astro

  { import = "plugins.spec.vim-astro" },
  -- go
  { import = "plugins.spec.go" },
  -- graphql
  { import = "plugins.spec.graphql" },
  --   -- SRE
  { import = "plugins.spec.sre" },

  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  --   -- UI

  -- Editor Enhancements
  { "wakatime/vim-wakatime", lazy = false }, -- Time tracking
  { import = "plugins.override.conform" }, -- Formatting
  { import = "plugins.spec.hop" }, -- Navigation

  -- Text Manipulation
  {
    "RRethy/vim-illuminate",
    lazy = true,
    event = "BufReadPost",
    config = function()
      require "configs.illuminate"
    end,
  },
  { "hrsh7th/vim-eft", lazy = true, event = "BufReadPost" },

  -- Scrolling
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    event = "BufReadPost",
    config = function()
      require "configs.neoscroll"
    end,
  },

  -- File Operations
  { "lambdalisue/suda.vim", cmd = "SudaWrite" }, -- Sudo write

  -- Completion
  { import = "plugins.spec.completion" },
}