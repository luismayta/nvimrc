---@type MappingsTable
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

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
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

M.copilot = {
	i = {
		["<C-a>"] = {
			"copilot#Accept()",
			"copilot accept suggestion",
			opts = { silent = true, expr = true, script = true },
		},
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
		["<leader>fg"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "  Find Word current buffer" },
	},
}

M.trouble = {
	n = {
		["<leader>dd"] = { "<cmd>TroubleToggle<CR>", "Toggle trouble" },
		["<leader>dw"] = { "<cmd>Trouble workspace_diagnostics<CR>", "Trouble workspace diagnostics" },
		["<leader>df"] = { "<cmd>Trouble document_diagnostics<CR>", "Trouble document diagnostics" },
		["<leader>dl"] = { "<cmd>Trouble loclist<CR>", "Trouble location list" },
		["<leader>dq"] = { "<cmd>Trouble quickfix<CR>", "Trouble quickfix" },
		["<leader>dr"] = { "<cmd>Trouble lsp_references<CR>", "Trouble lsp references" },
	},
}

M.lspconfig = {
	plugin = true,

	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"lsp declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"lsp definition",
		},

		["K"] = {
			function()
				vim.cmd([[Lspsaga hover_doc]])
			end,
			"lsp hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"lsp implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"lsp signature_help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"lsp definition type",
		},

		["<leader>ra"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"lsp rename",
		},

		["<leader>ca"] = {
			function()
				vim.cmd([[Lspsaga code_action]])
			end,
			"lsp code_action",
		},

		["gr"] = {
			function()
				vim.cmd([[Lspsaga lsp_finder]])
			end,
			"lsp references",
		},

		["<leader>f"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"floating diagnostic",
		},

		["<leader>ld"] = {
			function()
				vim.cmd([[Lspsaga show_line_diagnostics]])
			end,
			"show line diagnostics",
		},

		["<leader>cd"] = {
			function()
				vim.cmd([[Lspsaga show_cursor_diagnostics]])
			end,
			"show line diagnostics",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"goto prev",
		},

		["]d"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"goto_next",
		},

		-- ["<leader>q"] = "",

		["<leader>o"] = {
			function()
				vim.cmd([[LSoutlineToggle]])
			end,
			"Toggle symbol outline",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},

		["<leader>wa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"add workspace folder",
		},

		["<leader>wr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"remove workspace folder",
		},

		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"list workspace folders",
		},
	},
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgr"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

return M