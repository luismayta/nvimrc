local M = {}

M.ensure_installed = {
	-- lua stuff
	"lua-language-server",
	"stylua",

	-- web dev
	"css-lsp",
	"html-lsp",
	"typescript-language-server",
	"prettierd",
	"deno",
	"emmet-ls",
	"json-lsp",

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
	"bash-language-server",
	"intelephense",
	"yaml-language-server",
	"hadolint",
}

return M
