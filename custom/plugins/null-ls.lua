local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.terraform_fmt,
  b.formatting.prettier.with({
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "json",
      "jsonc",
      "markdown",
      "graphql",
      "handlebars",
    },
  }),

  -- Protos
  b.diagnostics.buf.with({ extra_args = { "--global vim" } }),

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

  -- Shell
  b.formatting.shfmt,
  -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function()
  null_ls.setup({
    debug = true,
    sources = sources,
    -- you can reuse a shared lspconfig on_attach callback here, this is autoformat on save config
    on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]])
      end
    end,
  })
end

return M
