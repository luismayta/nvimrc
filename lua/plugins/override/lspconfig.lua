return {
  "neovim/nvim-lspconfig",
  config = function()
    require "nvchad.configs.lspconfig"
    require "configs.lspconfig"
  end,
}
