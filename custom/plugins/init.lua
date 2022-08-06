return {
  ["sbdchd/neoformat"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["ray-x/cmp-treesitter"] = {
    after = "cmp-path",
  },
  -- ["goolord/alpha-nvim"] = {
  -- after = "base46",
  -- disable = false,
  -- config = function()
  -- require "plugins.configs.alpha"
  -- end,
  -- },
}
