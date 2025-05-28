vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("user.options")
require("user.keymaps")
require("user.plugins")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("user.lsp")
    require("user.cmp")
    require("user.treesitter")
    require("user.ui")
  end,
})
