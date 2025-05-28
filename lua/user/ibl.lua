-- File: lua/user/ibl.lua
vim.cmd [[highlight IndentScope guifg=#7aa2f7 gui=nocombine]]

require("ibl").setup({
  indent = {
    char = "│",
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    highlight = "IndentScope",
  },
})
