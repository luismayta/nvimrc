return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit Open" })
  end,
  config = function(_, opts)
    require("neogit").setup(opts)
  end,
}
