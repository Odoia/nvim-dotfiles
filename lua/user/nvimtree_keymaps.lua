-- Local keymaps for nvim-tree
local M = {}

M.on_attach = function(bufnr)
  local api = require("nvim-tree.api")
  local opts = function(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- General
  vim.keymap.set("n", "q", api.tree.close, opts("Close Tree"))
  vim.keymap.set("n", "R", api.tree.reload, opts("Refresh Tree"))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))

  -- Navigation
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open Vertical Split"))
  vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open Horizontal Split"))
  vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up a Directory"))
  vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("Set Root to Directory"))

  -- File operations
  vim.keymap.set("n", "a", api.fs.create, opts("Create"))
  vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
  vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
  vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
  vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))

  -- Clipboard
  vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
  vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))

  -- Visibility
  vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
  vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
  vim.keymap.set("n", "f", api.live_filter.start, opts("Filter by Name"))
  vim.keymap.set("n", "F", api.live_filter.clear, opts("Clear Filter"))
end

-- Global keymaps (available outside nvim-tree)
-- These should be defined globally, so we place them here for convenience

local keymap = vim.keymap

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
keymap.set("n", "<leader>ev", function()
  vim.cmd("NvimTreeOpen")
  vim.cmd("wincmd p")
end, { desc = "Open and focus NvimTree" })

return M
