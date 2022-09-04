local M = {}

local plugin_conf = require "custom.plugins.configs"
local mason_packages = require "custom.plugins.mason"
local userPlugins = require "custom.plugins"

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
    ["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = plugin_conf.treesitter,
    ["hrsh7th/nvim-cmp"] = plugin_conf.cmp,
    ["NvChad/ui"] = plugin_conf.chadui,
    ["williamboman/mason.nvim"] = mason_packages,
  },

  user = userPlugins,
}

M.mappings = require("custom.mappings")

return M
