local M = {}

M.ui = { border = "rounded" }
M.ensure_installed = {
  -- DevOps / SRE
  "ansiblels",
  -- Terraform
  "terraformls",
  "tflint",
  -- Docker
  "dockerls",
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
  -- "denols",

  -- JSON
  "fixjson",
  "jsonld-lsp",

  -- shell
  "shfmt",
  "shellcheck",
  "bashls",

  -- Python
  "black",
  "debugpy",
  "mypy",
  "ruff",
  "pyright",
  "isort",
  "jedi_language_server",
  "pythonlsp",
  "djlint",
  -- install 3rd party plugins
  -- :PylspInstall pylsp-mypy pylsp-rope pyls-memestra pyls-isort python-lsp-black python-lsp-ruff

  -- Markdown / Text
  "texlab", -- testing
  "alex",
  "markdownlint",
  "marksman",
  "proselint",
  "prosemd-lsp",

  -- solidity
  "solidity",
  "solidity-ls",

  -- rust
  "bacon",
  "bacon-ls",
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
  "json-to-struct",
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
}

M.pylsp_plugins_to_install = {
  "pyls-memestra",
  "pylsp-mypy",
  "pyls-isort",
  "python-lsp-black",
  "pylsp-rope",
  "python-lsp-ruff",
}

return M
