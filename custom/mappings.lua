local M = {}

local copymode = function()
	vim.cmd([[set nu!]])
	vim.cmd([[set rnu!]])
	if vim.opt.mouse:get().a then
		vim.cmd([[set mouse=]])
		print("You can use system copy now!")
	else
		vim.cmd([[set mouse=a]])
		print("Return to visual mode!")
	end
end

M.disable = {}

M.myconfig = {
	n = {
		["<leader>cc"] = { ":Telescope <CR>", "   Telescope" },
		["<leader>q"] = { ":q <CR>", "   exit" },
		["<F3>"] = { "<cmd> Neoformat <CR>", "   Neoformat" },
		["<leader>fm"] = { "<cmd> Neoformat <CR>", "   Neoformat" },
		["<F8>"] = { copymode, "  change to copy mode" },
	},

	v = {
		["<C-C>"] = { '"+y', "   Copied to System Clipboard" },
	},
}

M.override = {
	n = {
		["<leader>n"] = { copymode, "  change to copy mode" },
	},
}

M.nvimtree = {
	n = {
		["<F2>"] = { "<cmd> NvimTreeToggle <CR>", "   Toggle nvimtree" },
	},
}

M.focus = {
	n = {
		["<leader>h"] = { ":FocusSplitLeft<CR>", { silent = true } },
		["<leader>j"] = { ":FocusSplitDown<CR>", { silent = true } },
		["<leader>k"] = { ":FocusSplitUp<CR>", { silent = true } },
		["<leader>l"] = { ":FocusSplitRight<CR>", { silent = true } },
		["<C-x>1"] = { ":FocusMaximise<CR>", { silent = true } },
		["<C-x>2"] = { ":FocusSplitDown<CR>", { silent = true } },
		["<C-x>3"] = { ":FocusSplitRight<CR>", { silent = true } },
	},
}

M.lspconfig = {
	n = {
		["<leader>rn"] = {
			function()
				require("nvchad.ui.renamer").open()
			end,
			"   lsp rename",
		},
	},
}

M.telescope = {
	n = {
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  Find Buffers" },
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  Find File" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "  Recents" },
		["<leader>fr"] = { "<cmd> Telescope resume <CR>", "   Resume last search" },
		["<leader>fc"] = { "<cmd> Telescope commands <CR>", "   List all vim commands" },
		["<leader>fs"] = { "<cmd> Telescope treesitter <CR>", "   Search by outline in buffer" },
		["<leader>fl"] = { "<cmd> Telescope <CR>", "List all Telescope lists" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "  Find Word" },
	},
}

return M
