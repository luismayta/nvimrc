local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  -- theme
  ["catppuccin/nvim"] = {},
  ["nvim-telescope/telescope.nvim"] = {
    module = "telescope",
    opts = overrides.telescope,
  },
  -- TOOLS
  ["skywind3000/asynctasks.vim"] = {
    requires = "skywind3000/asyncrun.vim",
    cmd = { "AsyncTask", "AsyncTaskEdit" },
    opt = true,
  },
  ["folke/trouble.nvim"] = {
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
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    requires = { "nvim-lua/plenary.nvim" },
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

  -- AI
  -- {
  --   "zbirenbaum/copilot.lua",
  --   lazy = false,
  --   opts = function ()
  --     return require "custom.configs.copilot"
  --   end,
  --   config = function(_, opts)
  --     require("copilot").setup(opts)
  --   end
  -- },

  -- UI
  ["stevearc/dressing.nvim"] = {},
  ["beauwilliams/focus.nvim"] = {
    config = function()
      require("focus").setup()
    end,
  },
  ["rcarriga/nvim-notify"] = {
    module = "notify",
    config = function()
      require("notify").setup({
        stages = "fade",
      })
    end,
  },
  ["goolord/alpha-nvim"] = {
    requires = { "kyazdani42/nvim-web-devicons" },
  },
  ["folke/which-key.nvim"] = { disable = true },
  ["mbbill/undotree"] = {
    opt = true,
    cmd = "UndotreeToggle",
  },

  ["dstein64/nvim-scrollview"] = {
    opt = true,
    event = { "BufReadPost" },
    config = function()
      require("custom.configs.scrollview")
    end,
  },
  -- SRE
  ["hashivim/vim-terraform"] = {},

  -- Git
  ["lewis6991/gitsigns.nvim"] = {
    opts = overrides.gitsigns,
  },
  ["tpope/vim-fugitive"] = {},

  -- Editor
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  ["wakatime/vim-wakatime"] = {},
  ["hrsh7th/nvim-cmp"] = {},
  ["phaazon/hop.nvim"] = {
    opt = true,
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require("custom.configs.hop")
    end,
  },
  ["mg979/vim-visual-multi"] = {
    opt = true,
    event = "BufReadPost",
    setup = function()
      require("custom.configs.visual-multi")
    end,
  },
  ["tpope/vim-surround"] = {
    opt = true,
    event = "BufReadPost",
  },
  ["RRethy/vim-illuminate"] = {
    opt = true,
    event = "BufReadPost",
    config = function()
      require("custom.configs.illuminate")
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    opt = true,
    event = "BufReadPost",
    config = function()
      require("custom.configs.neoscroll")
    end,
  },
  ["hrsh7th/vim-eft"] = {
    opt = true,
    event = "BufReadPost",
  },
  ["lambdalisue/suda.vim"] = { cmd = "SudaWrite" },
  ["sbdchd/neoformat"] = {},
  ["ray-x/cmp-treesitter"] = {
    after = "cmp-path",
  },

  -- python
  ["ChristianChiarulli/swenv.nvim"] = {},
  ["nvim-neotest/neotest"] = {},
  ["nvim-neotest/neotest-python"] = {},
  ["rcarriga/nvim-dap-ui"] = {
    requires = {
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
  ["mfussenegger/nvim-dap"] = {
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end,
  },
  ["mfussenegger/nvim-dap-python"] = {
    ft = "python",
    requires = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
}

return plugins