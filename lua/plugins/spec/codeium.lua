return {
  "Exafunction/codeium.vim",
  lazy = false,
  config = function()
    -- stylua: ignore start
    vim.keymap.set("i", "<c-g>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })
    vim.keymap.set("i", "<c-;>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    vim.keymap.set("i", "<c-,>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    vim.keymap.set("i", "<c-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
    -- stylua: ignore end
  end,
}