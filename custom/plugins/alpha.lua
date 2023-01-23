local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 5,
		width = 36,
		align_shortcut = "right",
		hl = "AlphaButtons",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.225
local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

return {
	header = {
		type = "text",
		val = {
			"               █████████████▀▀▀▀▀▀▀▀▀▀▀▀▀█████████████",
			"               ████████▀▀░░░░░░░░░░░░░░░░░░░▀▀████████",
			"               ██████▀░░░░░░░░░░░░░░░░░░░░░░░░░▀██████",
			"               █████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████",
			"               ████░░░░░▄▄▄▄▄▄▄░░░░░░░░▄▄▄▄▄▄░░░░░████",
			"               ████░░▄██████████░░░░░░██▀░░░▀██▄░░████",
			"               ████░░███████████░░░░░░█▄░░▀░░▄██░░████",
			"               █████░░▀▀███████░░░██░░░██▄▄▄█▀▀░░█████",
			"               ██████░░░░░░▄▄▀░░░████░░░▀▄▄░░░░░██████",
			"               █████░░░░░█▄░░░░░░▀▀▀▀░░░░░░░█▄░░░█████",
			"               █████░░░▀▀█░█▀▄▄▄▄▄▄▄▄▄▄▄▄▄▀██▀▀░░█████",
			"               ██████░░░░░▀█▄░░█░░█░░░█░░█▄▀░░░░██▀▀▀▀",
			"               ▀░░░▀██▄░░░░░░▀▀█▄▄█▄▄▄█▄▀▀░░░░▄█▀░░░▄▄",
			"               ▄▄▄░░░▀▀██▄▄▄▄░░░░░░░░░░░░▄▄▄███░░░▄██▄",
			"               ██████▄▄░░▀█████▀█████▀██████▀▀░░▄█████",
			"               ██████████▄░░▀▀█▄░░░░░▄██▀▀▀░▄▄▄███▀▄██",
			"               ███████████░██░▄██▄▄▄▄█▄░▄░████████░███",
			"                                                                       ",
			"                                                                     ",
			"       ████ ██████           █████      ██                     ",
			"      ███████████             █████                             ",
			"      █████████ ███████████████████ ███   ███████████   ",
			"     █████████  ███    █████████████ █████ ██████████████   ",
			"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
			"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
			" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
			"                                                                       ",
		},
		opts = {
			position = "center",
			hl = "AlphaHeader",
		},
	},

	buttons = {
		type = "group",
		val = {
			button("Enter", "  Just type", ":enew<CR>"),
			button("SPC s d", "  Restore local session", ":lua require('persistence').load()<CR>"),
			button("SPC s l", "  Restore last session", ":lua require('persistence').load({ last = true })<CR>"),
			button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
			button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
			button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
			button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
			button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
			button("SPC e s", "  Settings", ":e ~/.config/nvchad/chadrc.lua | :cd %:p:h <CR>"),
		},
		opts = {
			spacing = 1,
		},
	},

	headerPaddingTop = { type = "padding", val = headerPadding },
	headerPaddingBottom = { type = "padding", val = 2 },
}
