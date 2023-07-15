local M = {}

M.ui = {
    statusline = { separator_style = "block" },

    tabufline = {
        enabled = true,
        lazyload = false,
    },
}

M.telescope = {
    override_options = {
        extensions_list = {
            "themes",
            "terms",
            "notify",
        },
    },
}

M.gitsigns = {
    current_line_blame = true,
}

M.treesitter = {
    override_options = {
        ensure_installed = "all",
    },
}

M.mason = {
    ensure_installed = {
        -- DevOps / SRE
        "ansible-language-server",
        -- Terraform
        "terraform-ls",
        "tflint",
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
        "prettier",
        "prettierd",
        "deno",
        "emmet-ls",

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
        "python-lsp-server",
        "pyright",
        "djlint",
        "sourcery",
        -- install 3rd party plugins
        -- :PylspInstall pylsp-mypy pylsp-rope pyls-memestra pyls-isort python-lsp-black python-lsp-ruff

        -- Markdown / Text
        "texlab", -- testing
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
        "solidity-ls",

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
        "goimports-reviser",
        "golangci-lint",
        "golangci-lint-langserver",
        "golines",
        "gomodifytags",
        "gopls",
        "gotests",
        "impl",
        "revive",
        "staticcheck",

        -- sql

        "sqls",
        "sqlls",
        "sql-formatter",

        -- Additional
        "intelephense",

        -- Others
        "jq",
        "jq-lsp",
        "vim-language-server",
        "vls",
    },
    pylsp_plugins_to_install = {
        "pyls-memestra",
        "pylsp-mypy",
        "pyls-isort",
        "python-lsp-black",
        "pylsp-rope",
        "python-lsp-ruff",
    },
}

M.nvimtree = {
    git = {
        enable = true,
    },
    filters = {
        custom = {
            "~$",
            ".pyc$",
            "^.DS_Store$",
            "^node_modules$",
            "^.ropeproject$",
            "^__pycache__$",
        },
    },
    diagnostics = {
        enable = true,
    },
}

M.cmp = function()
    local cmp = require("cmp")

    return {
        mapping = cmp.mapping.preset.insert({
            ["<C-f>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<C-s>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
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