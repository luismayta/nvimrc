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
}

return M
