-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

vim.cmd "highlight link St_HarpoonInactive StText"
vim.cmd "highlight link St_HarpoonActive St_LspHints"

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.ui = {
  theme = "catppuccin",
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.base46 = {
  integrations = {
    "cmp",
    "dap",
    "hop",
    "lsp",
    "todo",
    "mason",
    "neogit",
    "notify",
    "nvimtree",
    "whichkey",
    "devicons",
    "blankline",
    "rainbowdelimiters",
    "semantic_tokens",
    "codeactionmenu",
  },
}

M.plugins = "plugins"

M.mappings = require("mappings")

return M
