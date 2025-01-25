-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- lspservers with default config
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "pyright",
  "yamlls",
  "dockerls",
  "clojure_lsp",
  "cmake",
  "vimls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.terraformls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "terraform-ls", "serve" },
  root_dir = util.root_pattern(".terraform", ".git"),
}

lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  cmd_env = {
    GOFLAGS = "-tags=test,e2e_test,integration_test,acceptance_test",
  },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      linksInHover = false,
      codelenses = {
        generate = true,
        gc_details = true,
        regenerate_cgo = true,
        tidy = true,
        upgrade_depdendency = true,
        vendor = true,
      },
      usePlaceholders = true,
    },
  },
}

-- typescript
lspconfig.ts_ls.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  on_init = on_init,
  capabilities = capabilities,
}
