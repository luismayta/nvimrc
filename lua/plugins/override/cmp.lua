---@diagnostic disable: different-requires
return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local M = require "nvchad.configs.cmp"
    table.insert(M.sources, { name = "crates" })
    return M
  end,
}