vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("user.options")
require("user.keymaps")
require("user.plugins")

-- Git submodule check
local snippets_path = vim.fn.stdpath("config") .. "/snippets"
if vim.fn.isdirectory(snippets_path) == 0 then
  vim.notify("Initializing git submodules (snippets)...", vim.log.levels.INFO)
  vim.fn.system("git submodule update --init --recursive")
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("user.cmp")
    require("user.treesitter")
    require("user.ui")
  end,
})
