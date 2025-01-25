local M = {}

M.ui = {
  statusline = { separator_style = "block" },

  tabufline = {
    enabled = true,
    lazyload = false,
  },
}

M.telescope = {
  override_options = {
    extensions_list = {
      "themes",
      "terms",
      "notify",
    },
  },
}

M.gitsigns = {
  current_line_blame = true,
  preview_config = {
    border = "rounded",
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  use_treesitter = true,
}

M.nvimcmp = {
  sources = {
    { name = "copilot", group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },
}

return M
