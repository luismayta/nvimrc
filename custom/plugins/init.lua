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
  ["skywind3000/asynctasks.vim"] = {
    requires = "skywind3000/asyncrun.vim",
    cmd = { "AsyncTask", "AsyncTaskEdit" },
    opt = true,
  },
  ["ray-x/cmp-treesitter"] = {
    after = "cmp-path",
  },
  ["mbbill/undotree"] = {
    opt = true,
    cmd = "UndotreeToggle",
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["beauwilliams/focus.nvim"] = {
    config = function()
      require("focus").setup()
    end,
  },
  -- Or lazy load with `module` option. See further down for info on how to lazy load when using FocusSplit commands
  -- Or lazy load this plugin by creating an arbitrary command using the cmd option in packer.nvim
  -- use { 'beauwilliams/focus.nvim', cmd = { "FocusSplitNicely", "FocusSplitCycle" }, module = "focus",
  --     config = function()
  --         require("focus").setup({hybridnumber = true})
  --     end
  -- }
}
