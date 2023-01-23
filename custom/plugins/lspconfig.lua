-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

---@diagnostic disable-next-line: different-requires
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
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

if not configs.emmet_ls then
	configs["emmet_ls"] = {
		default_config = {
			cmd = { "ls_emmet", "--stdio" },
			filetypes = {
				"html",
				"css",
				"scss",
				"javascriptreact",
				"typescriptreact",
				"haml",
				"xml",
				"xsl",
				"pug",
				"slim",
				"sass",
				"stylus",
				"less",
				"sss",
				"hbs",
				"handlebars",
				"svelte",
				"vue",
			},
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Fix clangd 'multiple different client offset encodings' warning
local clangd_capabilities = capabilities
clangd_capabilities.offsetEncoding = "utf-8"
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = clangd_capabilities,
})
