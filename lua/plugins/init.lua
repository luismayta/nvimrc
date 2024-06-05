return {
  -- disabled
  { "NvChad/nvterm", enabled = false },
  -- theme
  { "catppuccin/nvim", lazy = false },
  -- { import = "plugins.spec.autosession" },
  -- { import = "plugins.spec.better-escape" },
  { import = "plugins.spec.ccc" },
  { import = "plugins.spec.codecompanion" },
  { import = "plugins.spec.codesnap" },
  -- AI
  { import = "plugins.spec.codeium" },
  -- TOOLS
  { import = "plugins.spec.asynctasks" },
  { import = "plugins.spec.trouble" },
  { import = "plugins.spec.b64" },

  { import = "plugins.spec.comment" },
  { import = "plugins.spec.crates" },
  -- { import = "plugins.spec.dap-python" },
  { import = "plugins.spec.dap-ui" },
  { import = "plugins.spec.dap-virtual-text" },
  { import = "plugins.spec.diffview" },
  { import = "plugins.spec.dressing" },
  { import = "plugins.spec.dropbar" },
  { import = "plugins.spec.edgy" },
  { import = "plugins.spec.fine-cmdline" },
  -- Git
  { import = "plugins.spec.fugitive" },
  { import = "plugins.spec.gitsigns" },

  { import = "plugins.spec.gleam" },
  { import = "plugins.spec.go" },
  { import = "plugins.spec.goto-preview" },
  { import = "plugins.spec.grug-far" },
  { import = "plugins.spec.harpoon" },
  { import = "plugins.spec.hop" },
  { import = "plugins.spec.hover" },
  { import = "plugins.spec.lsp-signature" },
  { import = "plugins.spec.matchup" },
  { import = "plugins.spec.md-preview" },
  { import = "plugins.spec.neocomposer" },
  -- { import = "plugins.spec.neogit" },
  { import = "plugins.spec.notify" },
  { import = "plugins.spec.outline" },
  { import = "plugins.spec.project" },
  { import = "plugins.spec.focus" },
  { import = "plugins.spec.rainbow-delimiters" },
  { import = "plugins.spec.regexplainer" },
  -- Languages

  -- python
  { "ChristianChiarulli/swenv.nvim", lazy = false },
  { "nvim-neotest/neotest", lazy = false },
  { "nvim-neotest/neotest-python", lazy = false },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  -- rust
  { import = "plugins.spec.rust" },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rust_clip_command = "xclip -selection clipboard"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  { import = "plugins.spec.rustaceanvim" },
  { import = "plugins.spec.screenkey" },
  { import = "plugins.spec.scrolleof" },
  { import = "plugins.spec.searchbox" },
  { import = "plugins.spec.swenv" },
  { import = "plugins.spec.tabby-ml" },
  { import = "plugins.spec.todo-comments" },
  { import = "plugins.spec.treesitter-textobjects" },
  { import = "plugins.spec.ts-autotag" },
  { import = "plugins.spec.ts-context-commentstring" },
  { import = "plugins.spec.tstools" },
  { import = "plugins.spec.undo-tree" },
  { import = "plugins.spec.vim-astro" },
  { import = "plugins.spec.zen-mode" },
  -- go
  { import = "plugins.spec.nvim-dap-go" },
  { import = "plugins.spec.gopher" },
  -- graphql
  { import = "plugins.spec.vim-graphql" },
  --   -- SRE
  { import = "plugins.spec.terraform" },
  { import = "plugins.override.blankline" },
  { import = "plugins.override.cmp" },
  { import = "plugins.override.conform" },
  -- LSP
  { import = "plugins.override.lspconfig" },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  { import = "plugins.override.luasnip" },
  { import = "plugins.override.mason" },
  -- ui
  { import = "plugins.override.nvim-colorizer" },
  { import = "plugins.override.nvim-tree" },
  { import = "plugins.override.nvim-treesitter" },
  { import = "plugins.override.nvim-web-devicons" },
  { import = "plugins.override.telescope" },
  { import = "plugins.override.whichkey" },
  --   -- UI
  { "stevearc/dressing.nvim", lazy = false },
  {
    "goolord/alpha-nvim",
    lazy = false,
  },
  {
    "mbbill/undotree",
    lazy = true,
    cmd = "UndotreeToggle",
  },
  {
    "dstein64/nvim-scrollview",
    lazy = true,
    config = function()
      require "configs.scrollview"
    end,
  },
  -- Editor
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "phaazon/hop.nvim",
    lazy = false,
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require "configs.hop"
    end,
  },
  {
    "tpope/vim-surround",
    lazy = true,
    event = "BufReadPost",
  },
  {
    "RRethy/vim-illuminate",
    lazy = true,
    event = "BufReadPost",
    config = function()
      require "configs.illuminate"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    event = "BufReadPost",
    config = function()
      require "configs.neoscroll"
    end,
  },
  {
    "hrsh7th/vim-eft",
    lazy = true,
    event = "BufReadPost",
  },
  { "lambdalisue/suda.vim", cmd = "SudaWrite" },
  { "sbdchd/neoformat", lazy = true },
  {
    "ray-x/cmp-treesitter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
  },
}
