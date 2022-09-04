local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
  b.formatting.deno_fmt,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

	b.formatting.terraform_fmt,

	-- webdev stuff
	b.formatting.deno_fmt,
	b.formatting.prettier,

	-- python
	b.diagnostics.flake8,
	b.formatting.black,

	-- C++, Java, JSON and so on
	b.formatting.clang_format,

	-- docker
	b.diagnostics.hadolint,
}

local M = {}

M.setup = function()
	null_ls.setup({
		sources = sources,
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
			end
		end,
	})
end

return M
