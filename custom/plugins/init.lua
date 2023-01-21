local override = require "custom.plugins.configs.override"

return {
  -- disabled
  ["NvChad/nvterm"] = { disable = true },
  -- tools
  ["skywind3000/asynctasks.vim"] = {
		requires = "skywind3000/asyncrun.vim",
		cmd = { "AsyncTask", "AsyncTaskEdit" },
		opt = true,
	},
  -- LSP
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      ---@diagnostic disable-next-line: different-requires
      require "custom.plugins.configs.lspconfig"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["williamboman/mason.nvim"] = require "custom.plugins.mason",

  -- UI
  ["beauwilliams/focus.nvim"] = {
		config = function()
			require("focus").setup()
		end,
	},
  ["goolord/alpha-nvim"] = {
		requires = { "kyazdani42/nvim-web-devicons" },
		disable = false,
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
  ["folke/which-key.nvim"] = { disable = true },
  ["NvChad/ui"] = {},
  ["kyazdani42/nvim-tree.lua"] ={},
  ["mbbill/undotree"] = {
		opt = true,
		cmd = "UndotreeToggle",
	},

  ["dstein64/nvim-scrollview"] = {
    opt = true,
    event = { "BufReadPost" },
    config = function()
      require "custom.plugins.configs.scrollview"
    end,
  },

  -- Git
  ["lewis6991/gitsigns.nvim"] = { override_options = override.gitsigns },
  ["tpope/vim-fugitive"] = {},

  -- Treesitter
  ["nvim-treesitter/nvim-treesitter"] = { override_options = override.treesitter },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["nvim-treesitter/nvim-treesitter-context"] = {
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.configs.treesitter-context"
    end,
  },
  -- Editor
  ["hashivim/vim-terraform"] = {},
  ["wakatime/vim-wakatime"] = {},
  ["hrsh7th/nvim-cmp"] = {
    override_options = override.cmp
  },
  ["abecodes/tabout.nvim"] = {
    opt = true,
    event = "InsertEnter",
    wants = "nvim-treesitter",
    after = "nvim-cmp",
    config = function()
      require "custom.plugins.configs.tabout"
    end,
  },
  ["phaazon/hop.nvim"] = {
    opt = true,
    event = "BufReadPost",
    branch = "v2",
    config = function()
      require "custom.plugins.configs.hop"
    end,
  },
  ["mg979/vim-visual-multi"] = {
    opt = true,
    event = "BufReadPost",
    setup = function()
      require "custom.plugins.configs.visual-multi"
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
      require "custom.plugins.configs.illuminate"
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    opt = true,
    event = "BufReadPost",
    config = function()
      require "custom.plugins.configs.neoscroll"
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
}
