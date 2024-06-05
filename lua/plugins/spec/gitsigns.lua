local overrides = require "configs.overrides"
return {
  "lewis6991/gitsigns.nvim",
  dependencies = "sindrets/diffview.nvim",
  opts = overrides.gitsigns,
}
