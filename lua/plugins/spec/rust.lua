return {
  "rust-lang/rust.vim",
  ft = "rust",
  init = function()
    vim.g.rustfmt_autosave = 1
    vim.g.rust_clip_command = "xclip -selection clipboard"
  end,
}