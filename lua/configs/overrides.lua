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

M.mason = {
  ui = { border = "rounded" },
  ensure_installed = {
    -- DevOps / SRE
    "ansible-language-server",
    -- Terraform
    "terraform-ls",
    "tflint",
    -- Docker
    "dockerfile-language-server",
    "hadolint",

    -- Lua
    "lua-language-server",
    "luacheck",
    "luaformatter",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "cssmodules-language-server",
    "typescript-language-server",
    "tailwindcss-language-server",
    "prettier",
    "prettierd",
    "deno",
    "emmet-ls",

    -- JSON
    "fixjson",
    "json-lsp",
    "json-to-struct",

    -- shell
    "shfmt",
    "shellcheck",
    "bash-language-server",

    -- Python
    "pylsp",
    "black",
    "debugpy",
    "mypy",
    "ruff",
    "pyright",
    "flake8",
    "isort",
    "jedi-language-server",
    "djlint",
    -- install 3rd party plugins
    -- :PylspInstall pylsp-mypy pylsp-rope pyls-memestra pyls-isort python-lsp-black python-lsp-ruff

    -- Markdown / Text
    "texlab", -- testing
    "alex",
    "grammarly-languageserver",
    "markdownlint",
    "marksman",
    "proselint",
    "prosemd-lsp",
    "remark-language-server",

    -- solidity
    "solidity",
    "solidity-ls",

    -- rust
    "rust-analyzer",

    -- C++
    "clangd",
    "clang-format",

    -- YAML
    "yaml-language-server",
    "yamllint",

    -- TOML
    "taplo",

    -- latex and md
    "ltex-ls",

    -- Go
    "delve",
    "go-debug-adapter",
    "gofumpt",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golines",
    "gomodifytags",
    "gopls",
    "gotests",
    "impl",
    "revive",
    "staticcheck",

    -- sql

    "sqls",
    "sqlls",
    "sql-formatter",

    -- Additional
    "intelephense",

    -- Others
    "jq",
    "jq-lsp",
    "vls",
    -- vim
    "vim-language-server",
    "vint",
  },
  pylsp_plugins_to_install = {
    "pyls-memestra",
    "pylsp-mypy",
    "pyls-isort",
    "python-lsp-black",
    "pylsp-rope",
    "python-lsp-ruff",
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
