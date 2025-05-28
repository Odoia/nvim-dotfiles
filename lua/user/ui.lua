-- Set colorscheme
vim.cmd.colorscheme("tokyonight")

-- Statusline
require("lualine").setup({
  options = {
    theme = "tokyonight",
    section_separators = "",
    component_separators = "",
  },
})

-- File explorer (nvim-tree) with separated keymaps
local tree_keys = require("user.nvimtree_keymaps")

require("nvim-tree").setup({
  on_attach = tree_keys.on_attach
})
