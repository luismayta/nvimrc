local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.stylua,
	b.formatting.black,
	b.formatting.prettierd,
	b.formatting.terraform_fmt,

	-- webdev stuff
	b.formatting.deno_fmt,
	b.formatting.prettier,

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

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
