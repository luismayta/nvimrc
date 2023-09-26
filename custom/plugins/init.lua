local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  -- disabled
  { "NvChad/nvterm", enabled = false },
  -- theme
  { "catppuccin/nvim", lazy = false },
  {"nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  -- TOOLS
  {"skywind3000/asynctasks.vim",
    dependencies = {"skywind3000/asyncrun.vim"},
    cmd = { "AsyncTask", "AsyncTaskEdit" },
    lazy = false,
  },
  {"folke/trouble.nvim",
    commands = { "Trouble", "TroubleToggle" },
    config = function()
      require("trouble").setup()
    end,
  },
  -- LSP
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  -- AI
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function ()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          go = true,
          rust = true,
        },
      })
    end,
  },

  -- UI
  { "stevearc/dressing.nvim", lazy = false },
  {
    "nvim-focus/focus.nvim",
    lazy = false,
    version = '*',
    config = function()
      require("focus").setup({
        ui = {
          cursorline = true,
          cursorcolumn = true,
          colorcolumn = {enable = true, list = '+1,+2'},
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "fade",
      })
    end,
  },
  {
    "goolord/alpha-nvim", lazy = false
  },
  {"folke/which-key.nvim", enabled = false },
  {"mbbill/undotree",
    lazy = true,
    cmd = "UndotreeToggle",
  },

  {"dstein64/nvim-scrollview",
    lazy = true,
    config = function()
      require("custom.configs.scrollview")
    end,
  },
  -- SRE
  {"hashivim/vim-terraform", lazy = false},

  -- Git
  {"lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  {"tpope/vim-fugitive", lazy = false},

  -- Editor
  {"folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("todo-comments").setup()
    end,
  },
  {"wakatime/vim-wakatime", lazy = false},


  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        end
      }
    },
    opts = overrides.nvimcmp,
  },
  {"phaazon/hop.nvim",
    lazy = false,
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require("custom.configs.hop")
    end,
  },
  -- {"mg979/vim-visual-multi",
  --   lazy = true,
  --   event = "BufReadPost",
  --   setup = function()
  --     require("custom.configs.visual-multi")
  --   end,
  -- },
  {"tpope/vim-surround",
    lazy = true,
    event = "BufReadPost",
  },
  {"RRethy/vim-illuminate",
    lazy = true,
    event = "BufReadPost",
    config = function()
      require("custom.configs.illuminate")
    end,
  },
  {"karb94/neoscroll.nvim",
    lazy = false,
    event = "BufReadPost",
    config = function()
      require("custom.configs.neoscroll")
    end,
  },
  {"hrsh7th/vim-eft",
    lazy = true,
    event = "BufReadPost",
  },
  {"lambdalisue/suda.vim", cmd = "SudaWrite" },
  {"sbdchd/neoformat", lazy = true},
  {"ray-x/cmp-treesitter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
  },

  -- python
  {"ChristianChiarulli/swenv.nvim", lazy = false},
  {"nvim-neotest/neotest", lazy = false},
  {"nvim-neotest/neotest-python", lazy = false},
  {"rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
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
  {"mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end,
  },
  {"mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}

return plugins