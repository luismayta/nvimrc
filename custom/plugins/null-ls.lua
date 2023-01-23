local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local fmt = b.formatting
local diag = b.diagnostics
local ca = b.code_actions

local sources = {
  fmt.alejandra,
  fmt.asmfmt,
  fmt.beautysh,
  fmt.black,
  fmt.brittany, -- Haskell
  fmt.buf,
  fmt.buildifier,
  fmt.cabal_fmt,
  fmt.cbfmt,
  fmt.clang_format,
  fmt.cljstyle,
  fmt.cmake_format,
  fmt.crystal_format,
  fmt.dfmt,
  fmt.fish_indent,
  fmt.fixjson,
  fmt.fnlfmt,
  fmt.gdformat,
  fmt.gofmt,
  fmt.goimports,
  fmt.google_java_format,
  fmt.isort, -- Python
  fmt.jq, -- JSON
  fmt.ktlint,
  fmt.latexindent,
  fmt.markdownlint,
  fmt.mix, -- Elixir
  fmt.nginx_beautifier,
  fmt.nimpretty,
  fmt.nixfmt,
  fmt.ocamlformat,
  fmt.ocdc, -- Changelogs
  fmt.prettierd,
  fmt.prismaFmt,
  fmt.protolint,
  fmt.ptop,
  fmt.rubocop,
  fmt.rustfmt,
  fmt.rustywind,
  fmt.scalafmt,
  fmt.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
  fmt.surface, -- Phoenix
  fmt.swiftformat,
  fmt.taplo,
  fmt.tidy,
  fmt.yamlfmt,
  fmt.zigfmt,

  diag.buf,
  diag.buildifier,
  diag.checkmake,
  diag.checkstyle,
  diag.chktex,
  diag.clj_kondo,
  diag.cmake_lint,
  diag.codespell,
  diag.credo,
  diag.dotenv_linter,
  diag.eslint_d,
  diag.fish,
  diag.gdlint,
  diag.hadolint,
  diag.jshint,
  diag.jsonlint,
  diag.ktlint,
  diag.protolint,
  diag.pycodestyle,
  diag.pydocstyle,
  diag.pylint,
  diag.revive,
  diag.selene,
  diag.shellcheck,
  diag.statix,
  diag.swiftlint,
  diag.tidy,
  diag.tsc,
  diag.yamllint,

  ca.cspell,
  ca.eslint_d,
  ca.shellcheck,
  ca.statix,
}

null_ls.setup({
  debug = false,
  sources = sources,
})

-- local sources = {
-- 	b.formatting.prettierd.with({
-- 		filetypes = { "html", "json", "markdown", "scss", "css", "typescript" },
-- 	}),
-- 	b.formatting.deno_fmt,
-- 	-- rust
-- 	b.formatting.rustfmt,
--
-- 	-- Lua
-- 	b.formatting.stylua,
-- 	b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),
--
-- 	-- Shell
-- 	b.formatting.shfmt,
-- 	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
--
-- 	b.formatting.terraform_fmt,
--
-- 	-- webdev stuff
-- 	b.formatting.deno_fmt,
-- 	b.formatting.prettier,
--
-- 	-- python
-- 	b.diagnostics.flake8,
-- 	b.formatting.black,
--
-- 	-- C++
-- 	b.formatting.clang_format,
--
-- 	-- docker
-- 	b.diagnostics.hadolint,
-- }
--
-- local M = {}
--
-- M.setup = function()
-- 	null_ls.setup({
-- 		sources = sources,
-- 		on_attach = function(client, bufnr)
-- 			-- Use null-ls for formatting
-- 			if client.name == "pylsp" then
-- 				client.server_capabilities.documentFormattingProvider = false
-- 			end
--
-- 			-- Use null-ls for formatting
-- 			if client.name == "tsserver" then
-- 				client.server_capabilities.documentFormattingProvider = false
-- 			end
--
-- 			if client.server_capabilities.documentFormattingProvider then
-- 				vim.cmd("nnoremap <silent><buffer> <Leader>= :lua vim.lsp.buf.format()<CR>")
-- 			end
--
-- 			if client.server_capabilities.documentRangeFormattingProvider then
-- 				vim.cmd("xnoremap <silent><buffer> <Leader>= :lua vim.lsp.buf.range_formatting({})<CR>")
-- 			end
--
-- 			if client.server_capabilities.documentFormattingProvider then
-- 				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
-- 			end
-- 		end,
-- 		-- Add LSP capabilities to cmp
-- 		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- 	})
-- end
--
-- return M
