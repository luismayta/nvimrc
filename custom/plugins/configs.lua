local M = {}

M.treesitter = {
	ensure_installed = {
		"lua",
		"vim",
		"json",
		"http",
		"make",
		"yaml",
		"toml",
		"markdown",
		"dockerfile",
		"bash",
		"python",
		"javascript",
		"html",
		"css",
	},
}

M.nvimtree = {
	git = {
		enable = false,
		ignore = false,
	},
	filesystem_watchers = {
		enable = true,
	},
	view = {
		hide_root_folder = false,
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "<C-e>", action = "" },
			},
		},
	},
	renderer = {
		add_trailing = true,
		indent_markers = {
			enable = true,
		},
	},
	filters = {
		custom = {
			"^.git$",
		},
	},
}

M.cmp = {
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 4 },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}

M.chadui = {
	tabufline = {
		enabled = true,
	},
}

return M
