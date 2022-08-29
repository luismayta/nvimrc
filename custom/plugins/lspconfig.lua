-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	-- Web
	"tsserver",
	"cssls",
	"html",
	"cssls",
	"jsonls",
	"denols",
	"tsserver",

	"emmet_ls",
	"pyright",
	"rust_analyzer",
	"solc",
	"clangd",
	"dockerls",
	"ltex",
	"bashls",

	"intelephense",

	-- Terraform
	"terraform_lsp",
	"terraformls",
	"tflint",

	"yamlls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
