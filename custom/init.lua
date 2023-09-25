require("custom.options")

-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.g.dap_virtual_text = true
vim.opt.colorcolumn = "80"

-- Disable persistent undo
vim.opt.undofile = false

-- Remember cursor position when reopening files
vim.api.nvim_exec(
	[[
  augroup remember-cursor-position
      autocmd!
      autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"zz" | endif
  augroup END
]],
	false
)

-- Auto format on save
vim.api.nvim_exec(
	[[
  augroup auto-format
      autocmd!
      autocmd BufWritePre * lua vim.lsp.buf.format({sync = true})
  augroup END
]],
	false
)
