-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {

	-- Ansible
	"ansiblels",

	-- solidity
	"solc",

	-- Compilation
	"cmake",
	"gradle_ls",

	-- Docker
	"dockerls",

	-- Web
	"tsserver",
	"html",
	"denols",
	"tsserver",
	"emmet_ls",
	"cssls",
	"cssmodules_ls",
	"tailwindcss",

	-- JSON
	"jsonls",

	-- Go
	"golangci_lint_ls",
	"gopls",

	-- Markdown
	"marksman",

	-- Rust
	"rust_analyzer",

	-- Shell
	"awk_ls",
	"bashls",

	-- Terraform
	"terraform_lsp",
	"terraformls",
	"tflint",

	-- Python
	"jedi_language_server",
	"pylsp",
	"pyre",
	"pyright",

	-- Lua
	"sumneko_lua",

	-- TOML
	"taplo",

	-- yaml
	"yamlls",

	-- Others
	"clangd",
	"ltex",

	"intelephense",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
