# 🧠 Neovim Setup for Any Project

This document describes how to set up Neovim for full functionality in any project, including LSP, Treesitter, autocomplete, snippets, and more.

---

## ✅ Prerequisites

Make sure these tools are installed and available:

```bash
which nvim
which node
which npm
which yarn
which ruby
which bundler
```

If any of these are missing, install them using Homebrew, Mise, or another method.

---

## 🧪 One-liner Setup for New Projects

Run this after cloning or opening a new project:

```bash
nvim +"checkhealth" \
     +"TSInstall lua ruby javascript typescript html css json bash tsx" \
     +"TSUpdate" \
     +"MasonInstall ruby-lsp lua_ls tsserver html-lsp css-lsp" \
     +q
```

---

## 🧠 Treesitter

Ensures syntax highlighting and indentation:

```bash
nvim +"TSInstall lua ruby javascript typescript html css json bash tsx" +"TSUpdate" +q
```

---

## 🔧 Mason (LSP Installer)

To install required language servers:

```bash
nvim +"MasonInstall ruby-lsp lua_ls tsserver html-lsp css-lsp" +q
```

To check installed/active servers:

```vim
:LspInfo
```

---

## 🧩 Plugin Management

To sync and install plugins using Lazy:

```bash
nvim +Lazy sync +q
```

To open Lazy UI:

```vim
:Lazy
```

---

## 🔍 Diagnostic and Formatting

Inside Neovim:

```vim
:lua vim.diagnostic.open_float()
:lua vim.lsp.buf.format()
```

---

## 🧪 Autocomplete Test

1. Open a Ruby or JS/TS file.
2. Start typing (e.g., `Stri`)
3. Press `<C-Space>` to trigger suggestions.

---

## 📦 Snippets

Snippets are loaded automatically from `friendly-snippets` using:

```lua
require("luasnip.loaders.from_vscode").lazy_load()
```

---

## 🎯 Useful Neovim Keymaps (Leader = `<space>`)

| Mode | Mapping           | Action                             |
|------|-------------------|-------------------------------------|
| n    | `<leader>ff`      | Find files (Telescope)              |
| n    | `<leader>fg`      | Live grep                           |
| n    | `<leader>fb`      | List open buffers                   |
| n    | `<leader>fh`      | Search help tags                    |
| n    | `<leader>e`       | Toggle file explorer (NvimTree)     |
| n    | `<leader>q`       | Close buffer                        |
| n    | `<leader>rr`      | Reload current Lua config           |
| n    | `<leader>gd`      | Go to definition                    |
| n    | `<leader>gr`      | Go to references                    |
| n    | `<leader>rn`      | Rename symbol                       |
| n    | `<leader>ca`      | Show code actions                   |
| i    | `<C-Space>`       | Trigger autocomplete (nvim-cmp)     |

---

## 🧰 Summary

✔ Neovim working with:
- LSP for Ruby, Lua, TS, JS, HTML, CSS
- Treesitter for syntax and indentation
- Autocomplete with `nvim-cmp`
- Snippets from `friendly-snippets`
- Telescope, File Explorer, and custom keymaps

After cloning a project, just run the one-liner setup and you're ready to code.

---

