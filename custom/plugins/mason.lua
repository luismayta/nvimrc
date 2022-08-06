local M = {}

M.ensure_installed = {
  -- lua stuff
  "lua-language-server",
  "stylua",

  -- web dev
  "css-lsp",
  "html-lsp",
  "typescript-language-server",
  "deno",
  "emmet-ls",
  "json-lsp",

  -- shell
  "shfmt",
  "shellcheck",
  "bash-language-server",

  -- python
  "flake8",
  "pyright",
  "black",

  -- solidity
  "solidity",

  -- rust
  "rust-analyzer",

  -- C++
  "clangd",
  "clang-format",

  -- yaml
  "yaml-language-server",

  -- docker
  "dockerfile-language-server",

  -- latex and md
  "ltex-ls",

  -- go
  "gopls",
}

return M
