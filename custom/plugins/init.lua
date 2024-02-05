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
  -- Languages
  -- rust
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
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local M = require("plugins.configs.cmp")
			table.insert(M.sources, { name = "crates" })
			return M
		end,
	},
  -- AI
  {
		"Exafunction/codeium.vim",
		lazy = false,
		config = function()
      -- stylua: ignore start
			vim.keymap.set("i", "<c-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
      -- stylua: ignore end
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
  {"phaazon/hop.nvim",
    lazy = false,
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require("custom.configs.hop")
    end,
  },
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
  -- go
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