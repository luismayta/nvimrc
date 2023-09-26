---@type ChadrcConfig
local M = {}

-- local user_plugins = require("custom.plugins")

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
  theme = "catppuccin",
  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M