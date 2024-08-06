require("gitsigns").setup({
  signs = { untracked = { text = "|" }, },
  signcolumn = false,
  current_line_blame = true,
})
