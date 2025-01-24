return {
  -- Core UI and Themes
  { "NvChad/nvterm", enabled = false },  -- Disabled plugin
  {
    "NvChad/base46",
    branch = "v3.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "NvChad/ui",
    branch = "v3.0",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },
  { "catppuccin/nvim", lazy = false },  -- Theme
  { import = "plugins.spec.ccc" },
  -- AI and Coding Assistance
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    opts = {
      provider = "openai",
      auto_suggestions_provider = "openai",
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
        api_key_name = "OPENAI_API_KEY",
      },
    },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {

        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {

          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {

        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
  { import = "plugins.spec.codecompanion" },
  { import = "plugins.spec.codesnap" },
  -- -- lsp
  { import = "plugins.spec.nvim-lspconfig" },
  { import = "plugins.spec.mason-lspconfig" },
  -- TOOLS
  { import = "plugins.spec.asynctasks" },
  { import = "plugins.spec.trouble" },
  { import = "plugins.spec.b64" },

  { import = "plugins.spec.crates" },
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

  -- navigation

  { import = "plugins.spec.go" },
  { import = "plugins.spec.goto-preview" },
  { import = "plugins.spec.grug-far" },
  { import = "plugins.spec.harpoon" },
  { import = "plugins.spec.hover" },
  { import = "plugins.spec.matchup" },
  { import = "plugins.spec.neocomposer" },
  { import = "plugins.spec.notify" },
  { import = "plugins.spec.outline" },
  { import = "plugins.spec.project" },
  { import = "plugins.spec.focus" },
  { import = "plugins.spec.rainbow-delimiters" },
  { import = "plugins.spec.regexplainer" },
  -- Languages
  -- others
  { import = "plugins.spec.gleam" },

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
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
  },
  -- rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
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
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  { import = "plugins.spec.screenkey" },
  { import = "plugins.spec.scrolleof" },
  { import = "plugins.spec.searchbox" },
  { import = "plugins.spec.swenv" },
  { import = "plugins.spec.todo-comments" },
  { import = "plugins.spec.treesitter-textobjects" },
  { import = "plugins.spec.ts-autotag" },
  { import = "plugins.spec.ts-context-commentstring" },
  -- { import = "plugins.spec.tstools" },
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
  { import = "plugins.override.cmp" },

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
  { import = "plugins.override.nvim-colorizer" },
  { import = "plugins.override.nvim-tree" },
  { import = "plugins.override.nvim-treesitter" },
  { import = "plugins.override.nvim-web-devicons" },
  { import = "plugins.override.telescope" },
  { import = "plugins.override.whichkey" },
  --   -- UI
  { import = "plugins.override.blankline" },
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
  -- Editor Enhancements
  { "wakatime/vim-wakatime", lazy = false },  -- Time tracking
  { import = "plugins.override.conform" },    -- Formatting
  { import = "plugins.spec.hop" },            -- Navigation

  -- Text Manipulation
  { "tpope/vim-surround", lazy = true, event = "BufReadPost" },
  { "RRethy/vim-illuminate", lazy = true, event = "BufReadPost", config = function() require "configs.illuminate" end },
  { "hrsh7th/vim-eft", lazy = true, event = "BufReadPost" },

  -- Scrolling
  { "karb94/neoscroll.nvim", lazy = false, event = "BufReadPost", config = function() require "configs.neoscroll" end },

  -- File Operations
  { "lambdalisue/suda.vim", cmd = "SudaWrite" },  -- Sudo write

  -- Completion
  {
    "ray-x/cmp-treesitter",
    dependencies = { "hrsh7th/nvim-cmp" },
  },
}
