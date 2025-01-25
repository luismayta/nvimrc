return {
  {
    "catppuccin/nvim",
    lazy = false,
  },
  {
    "NvChad/base46",
    branch = "v3.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "NvChad/ui",
    branch = "v3.0",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },
}
