---@type ChadrcConfig
local M = {}

vim.cmd "highlight link St_HarpoonInactive StText"
vim.cmd "highlight link St_HarpoonActive St_LspHints"

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "catppuccin",
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,

    header = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    },

    buttons = {
      { "  Find File", ", f f", "Telescope find_files" },
      { "󰈚  Recent Files", ", f o", "Telescope oldfiles" },
      { "󰈭  Find Word", ", f w", "Telescope live_grep" },
      { "  Bookmarks", ", m a", "Telescope marks" },
      { "  Themes", ", t h", "Telescope themes" },
      { "  Mappings", ", c h", "NvCheatsheet" },
    },
  },

  term = {
    enabled = false,
  },
}

return M
