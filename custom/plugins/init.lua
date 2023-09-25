local override = require("custom.plugins.configs.override")
local cmp = require "cmp"

local plugins = {
  ["nvim-telescope/telescope.nvim"] = {
    module = "telescope",
    override_options = override.telescope.override_options,
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
  ["williamboman/mason.nvim"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function(_, opts)
      require("plugins.configs.lspconfig")
      ---@diagnostic disable-next-line: different-requires
      require("custom.plugins.configs.lspconfig")
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    requires = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require("custom.plugins.configs.null-ls")
    end,
  },

  -- AI
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    opts = function ()
      return require "custom.plugins.configs.copilot"
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
    end
  },

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
    disable = false,
    override_options = require("custom.plugins.alpha"),
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
      require("custom.plugins.configs.scrollview")
    end,
  },
  -- SRE
  ["hashivim/vim-terraform"] = {},

  -- Git
  ["lewis6991/gitsigns.nvim"] = { override_options = override.gitsigns },
  ["tpope/vim-fugitive"] = {},

  -- Treesitter
  ["nvim-treesitter/nvim-treesitter"] = { override_options = override.treesitter },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["nvim-treesitter/nvim-treesitter-context"] = {
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.configs.treesitter-context")
    end,
  },
  -- Editor
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  ["wakatime/vim-wakatime"] = {},
  ["hrsh7th/nvim-cmp"] = {
    override_options = override.cmp,
  },
  ["abecodes/tabout.nvim"] = {
    opt = true,
    event = "InsertEnter",
    wants = "nvim-treesitter",
    after = "nvim-cmp",
    config = function()
      require("custom.plugins.configs.tabout")
    end,
  },
  ["phaazon/hop.nvim"] = {
    opt = true,
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require("custom.plugins.configs.hop")
    end,
  },
  ["mg979/vim-visual-multi"] = {
    opt = true,
    event = "BufReadPost",
    setup = function()
      require("custom.plugins.configs.visual-multi")
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
      require("custom.plugins.configs.illuminate")
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    opt = true,
    event = "BufReadPost",
    config = function()
      require("custom.plugins.configs.neoscroll")
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
