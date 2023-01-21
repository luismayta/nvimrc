local M = {}

M.ui = {
  statusline = { separator_style = "block" },

  tabufline = {
    enabled = true,
    lazyload = false,
  },
}

M.gitsigns = {
  current_line_blame = true,
}

M.treesitter = {
  ensure_installed = {
    "lua",
		"vim",
		"json",
		"http",
		"make",
		"yaml",
		"toml",
		"markdown",
		"dockerfile",
		"bash",
		"python",
		"javascript",
		"html",
		"css",
    "bash",
    "go",
    "gomod",
    "gowork",
    "lua",
    "yaml",
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
    },
  },
}

M.mason = {
ensure_installed = {
	-- DevOps / SRE
	"ansible-language-server",

	-- Docker
	"dockerfile-language-server",
	"hadolint",

	-- Lua
	"lua-language-server",
	"luacheck",
	"luaformatter",
	"stylua",

	-- Web
	"css-lsp",
	"html-lsp",
	"cssmodules-language-server",
	"typescript-language-server",
	"tailwindcss-language-server",
	"prettierd",
	"deno",
	"emmet-ls",
	"djlint",

	-- JSON
	"fixjson",
	"json-lsp",
	"json-to-struct",

	-- shell
	"shfmt",
	"shellcheck",
	"bash-language-server",

	-- Python
	"black",
	"debugpy",
	"flake8",
	"isort",
	"jedi-language-server",
	"mypy",
	"pylint",
	"python-lsp-server",
	"sourcery",

	-- Markdown / Text
	"alex",
	"grammarly-languageserver",
	"markdownlint",
	"marksman",
	"proselint",
	"prosemd-lsp",
	"remark-language-server",
	"vale",
	"write-good",

	-- solidity
	"solidity",

	-- rust
	"rust-analyzer",

	-- C++
	"clangd",
	"clang-format",

	-- YAML
	"yaml-language-server",
	"yamllint",

	-- TOML
	"taplo",

	-- latex and md
	"ltex-ls",

	-- Go
	"delve",
	"go-debug-adapter",
	"gofumpt",
	"goimports",
	"golangci-lint",
	"golangci-lint-langserver",
	"golines",
	"gomodifytags",
	"gopls",
	"gotests",
	"impl",
	"revive",
	"staticcheck",

	-- Terraform
	"terraform-ls",
	"tflint",

	-- Additional
	"intelephense",

	-- Others
	"jq",
}
}

M.nvimtree = {
  git = {
    enable = true,
  },
  diagnostics = {
    enable = true,
  },
}

M.cmp = function()
  local cmp = require "cmp"

  return {
    mapping = cmp.mapping.preset.insert {
      ["<C-f>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<C-s>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "treesitter" },
    },
  }
end

return M
