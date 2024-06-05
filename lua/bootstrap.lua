vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = ","

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  { "Bilal2453/luvit-meta" },
  { "justinsgithub/wezterm-types" },
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      -- require "colorify"
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- Load themes
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

-- Re-activate providers
for _, v in pairs { "python3_provider", "node_provider" } do
  vim.g["loaded_" .. v] = nil
  vim.cmd("runtime " .. v)
end

-- No dashboard for me
vim.api.nvim_del_user_command "Nvdash"
