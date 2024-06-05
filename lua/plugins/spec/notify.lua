return {
  "rcarriga/nvim-notify",
  event = "BufWinEnter",
  config = function()
    dofile(vim.g.base46_cache .. "notify")
    vim.notify = require "notify"
    ---@diagnostic disable-next-line
    vim.notify.setup {
      background_colour = "#1c2433",
      top_down = true,
      stages = "fade",
    }
  end,
}