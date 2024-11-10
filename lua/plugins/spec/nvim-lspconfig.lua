return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = function(client, bufnr) end,
        }
      end,

      ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
          capabilities = capabilities,
        }
      end,

      ["pyright"] = function()
        lspconfig.pyright.setup {
          capabilities = capabilities,
        }
      end,

      ["ts_ls"] = function()
        lspconfig.ts_ls.setup {
          root_dir = function(filename)
            if
              lspconfig.util.root_pattern "package.json"(filename)
              or lspconfig.util.root_pattern "tsconfig.json"(filename)
            then
              return lspconfig.util.find_git_ancestor(filename)
            end
          end,
          single_file_support = false,
        }
      end,

      ["denols"] = function()
        lspconfig.denols.setup {
          root_dir = lspconfig.util.root_pattern "deno.json",
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
            -- Disable eslint for deno project
            if lspconfig.util.root_pattern "package.json"(vim.fn.getcwd()) then
              if client.name == "denols" then
                client.stop()
                return
              end
            end
          end,
        }
      end,
    }
  end,
}
