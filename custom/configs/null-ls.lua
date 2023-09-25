local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local b = null_ls.builtins

local goimports = b.formatting.goimports
local e = os.getenv("GOIMPORTS_LOCAL")
if e ~= nil then
  goimports = goimports.with({ extra_args = { "-local", e } })
end

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- chosen deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- cpp
  b.formatting.clang_format,

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

null_ls.setup {
  debug = true,
  sources = sources,
}
