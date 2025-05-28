require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "ruby", "javascript", "html", "css" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
