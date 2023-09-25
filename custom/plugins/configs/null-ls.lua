local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local goimports = b.formatting.goimports
local e = os.getenv("GOIMPORTS_LOCAL")
if e ~= nil then
  goimports = goimports.with({ extra_args = { "-local", e } })
end

local sources = {
  -- Go
  goimports,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
  -- python

  null_ls.builtins.formatting.black,
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.ruff,
}

local opts = {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts