return {

	["hashivim/vim-terraform"] = {},

	["wakatime/vim-wakatime"] = {},

	-- tmux.nvim
	--
	-- https://github.com/aserowy/tmux.nvim
	["aserowy/tmux.nvim"] = {
		config = function()
			require("tmux").setup({
				copy_sync = {
					enable = true,
				},
			})
		end,
	},

	["karb94/neoscroll.nvim"] = {
		config = function()
			require("neoscroll").setup({
				hide_cursor = false,
				easing_function = "sine",
			})
		end,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("custom.plugins.null-ls").setup()
		end,
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	["tpope/vim-surround"] = {},

	["tpope/vim-fugitive"] = {},

	["lambdalisue/suda.vim"] = { cmd = "SudaWrite" },

	["folke/which-key.nvim"] = {
		disable = true,
	},

	["sbdchd/neoformat"] = {},
	["skywind3000/asynctasks.vim"] = {
		requires = "skywind3000/asyncrun.vim",
		cmd = { "AsyncTask", "AsyncTaskEdit" },
		opt = true,
	},
	["ray-x/cmp-treesitter"] = {
		after = "cmp-path",
	},
	["mbbill/undotree"] = {
		opt = true,
		cmd = "UndotreeToggle",
	},
	["goolord/alpha-nvim"] = {
		disable = false,
	},
	["beauwilliams/focus.nvim"] = {
		config = function()
			require("focus").setup()
		end,
	},
}
