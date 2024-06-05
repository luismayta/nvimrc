return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  ft = {
    "astro",
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "glimmer",
    "handlebars",
    "hbs",
  },
  config = function()
    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }
  end,
}
