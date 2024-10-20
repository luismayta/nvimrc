local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspservers with default config
local servers = { "clangd", "pylsp", "pyright", "html", "cssls", "ts_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

lspconfig.pylsp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "terraform-ls", "serve" },
  root_dir = util.root_pattern(".terraform", ".git"),
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
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
