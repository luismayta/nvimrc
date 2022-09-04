local M = {}

M.ensure_installed = {
	-- DevOps / SRE
	"ansible-language-server",

	-- Docker
	"dockerfile-language-server",
	"hadolint",

	-- Lua
	"lua-language-server",
	"luacheck",
	"luaformatter",
	"stylua",

	-- Web
	"css-lsp",
	"html-lsp",
	"cssmodules-language-server",
	"typescript-language-server",
	"tailwindcss-language-server",
	"prettierd",
	"deno",
	"emmet-ls",
	"djlint",

	-- JSON
	"fixjson",
	"json-lsp",
	"json-to-struct",

	-- shell
	"shfmt",
	"shellcheck",
	"bash-language-server",

	-- Python
	"black",
	"debugpy",
	"flake8",
	"isort",
	"jedi-language-server",
	"mypy",
	"pylint",
	"python-lsp-server",
	"sourcery",

	-- Markdown / Text
	"alex",
	"grammarly-languageserver",
	"markdownlint",
	"marksman",
	"proselint",
	"prosemd-lsp",
	"remark-language-server",
	"vale",
	"write-good",

	-- solidity
	"solidity",

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
	"golangci-lint",
	"golangci-lint-langserver",
	"golines",
	"gomodifytags",
	"gopls",
	"gotests",
	"impl",
	"revive",
	"staticcheck",

	-- Terraform
	"terraform-ls",
	"tflint",

	-- Additionals
	"intelephense",

	-- Others
	"jq",
}

return M
