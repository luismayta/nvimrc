local configs_mason = require "configs.mason"

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require "lspconfig"
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "different-requires" },
            },
          },
        },
      }

      lspconfig.gopls.setup {
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          env = {
            GOEXPERIMENT = "rangefunc",
          },
          formatting = {
            gofumpt = true,
          },
        },
      }

      lspconfig.tailwindcss.setup {
        settings = {
          includeLanguages = {
            templ = "html",
          },
        },
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      lspconfig.templ.setup {}
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = configs_mason.ensure_installed,
    dependencies = { "williamboman/mason.nvim" },
    cmd = {
      "MasonToolsInstall",
      "MasonToolsInstallSync",
      "MasonToolsUpdate",
      "MasonToolsUpdateSync",
      "MasonToolsClean",
    },
  },
}
