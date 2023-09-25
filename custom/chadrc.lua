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
-- M.plugins = {
--
--   remove = {
--     "NvChad/nvterm",
--   },
--
--   override = {
--     ["NvChad/ui"] = override.ui,
--     ["lewis6991/gitsigns.nvim"] = override.gitsigns,
--     ["hrsh7th/nvim-cmp"] = override.cmp,
--   },
--
--   user = user_plugins,
-- }

M.mappings = require("custom.mappings")

return M