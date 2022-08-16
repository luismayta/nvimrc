-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local override = require "custom.plugins.override"
-- local userOptions = require "custom.options"
local userPlugins = require "custom.plugins"

M.options = {
   user = function()
      vim.g.mapleader = ','
   end,
}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "onedark",
  transparency = false,
}

M.plugins = {
  user = userPlugins,
  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["williamboman/mason.nvim"] = require "custom.plugins.mason",
    ["hrsh7th/nvim-cmp"] = override.cmp,
  },
}

M.options = require "custom.options"
M.mappings = require "custom.mappings"

return M
