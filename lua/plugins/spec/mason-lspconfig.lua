local overrides = require "configs.mason-lspconfig"

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = overrides.ensure_installed,
      automatic_installation = true,
    })
  end,
}