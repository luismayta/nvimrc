local M = {}

local override = require "custom.plugins.configs.override"
local mason_packages = require "custom.plugins.mason"
local user_plugins = require "custom.plugins"

M.options = {
  mapleader = ",",
}

M.ui = {
  theme = "onedark",
  transparency = false,
}

M.plugins = {

  remove = {
    "NvChad/nvterm",
  },

  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["NvChad/ui"] =  override.ui ,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree ,
    ["lewis6991/gitsigns.nvim"] = override.gitsigns,
    ["williamboman/mason.nvim"] = mason_packages,
    ["hrsh7th/nvim-cmp"] = override.cmp,
  },

  user = user_plugins,
}

M.mappings = require("custom.mappings")

return M
