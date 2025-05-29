# Neovim Project Setup for Rails

This guide helps ensure your Neovim is fully set up with your custom dotfiles for any new Rails project.

## ✅ Requirements Check

Before you start, make sure the following are installed:

```bash
node -v && echo "Node OK" || echo "Node Missing"
ruby -v && echo "Ruby OK" || echo "Ruby Missing"
npm -v && echo "NPM OK" || echo "NPM Missing"
```

You should also have:

- `neovim` installed with Lua support
- Your dotfiles cloned and symlinked or copied properly
- Language servers installed via Mason

## 🧠 Mason LSP & Treesitter

Open Neovim and run the following commands:

```bash
:Mason
:MasonInstall lua-language-server ruby-lsp tsserver html cssls jsonls bashls
:TSInstall lua ruby javascript typescript html css json bash tsx
```

## ✨ Telescope & LSP Keybindings

| Keybinding       | Action                           |
|------------------|----------------------------------|
| `<leader>ff`     | Find Files                       |
| `<leader>fg`     | Live Grep                        |
| `<leader>fb`     | Find Buffers                     |
| `<leader>fh`     | Help Tags                        |
| `<leader>fm`     | Find Model File (Rails)          |
| `<leader>fc`     | Find Controller File (Rails)     |
| `<leader>fs`     | Find Service File (Rails)        |
| `<leader>ft`     | Find Test File (spec/test)       |
| `<leader>fdb`    | Find Migration File              |
| `gd`             | Go to Definition                 |
| `K`              | Show Hover                       |
| `gr`             | List References                  |
| `<leader>lf`     | Format Document                  |
| `<leader>ld`     | Show Diagnostics                 |

## 🔀 Window Navigation

| Mode | Keybinding | Action                  |
|------|------------|-------------------------|
| Normal | `<C-h>`  | Move to left window     |
| Normal | `<C-j>`  | Move to bottom window   |
| Normal | `<C-k>`  | Move to top window      |
| Normal | `<C-l>`  | Move to right window    |
| Terminal | `<C-h>`| Terminal: left window   |
| Terminal | `<C-j>`| Terminal: bottom window |
| Terminal | `<C-k>`| Terminal: top window    |
| Terminal | `<C-l>`| Terminal: right window  |

## 🗂️ File Tree Operations (NvimTree)

| Keybinding   | Action                       |
|--------------|------------------------------|
| `<leader>ma` | Add new file/directory       |
| `<leader>mr` | Rename file/directory        |
| `<leader>md` | Delete file/directory        |

## ℹ️ Notes

- `vim.g.mapleader` is set to `,`
- All configurations are located in your repo: [nvim-dotfiles](https://github.com/Odoia/nvim-dotfiles/tree/main/lua/user)
