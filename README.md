# 🧠 Neovim Project Setup for Rails

This guide ensures your Neovim environment (with your custom dotfiles) works 100% in any new Rails project.

---

## ✅ Requirements Check

Run this to ensure all core tools are installed:

```bash
node -v && echo "Node OK" || echo "Node Missing"
ruby -v && echo "Ruby OK" || echo "Ruby Missing"
npm -v && echo "NPM OK" || echo "NPM Missing"
nvim --version | head -n 1
```

You should also have:

- Neovim (>= 0.9) installed with Lua support
- Your dotfiles from [nvim-dotfiles](https://github.com/Odoia/nvim-dotfiles) properly set up
- Plugins installed (run `:Lazy` and press `l` to sync)

---

## 🧩 Treesitter & Mason Setup

Launch Neovim and run:

```vim
:Mason
:MasonInstall lua-language-server ruby-lsp tsserver html cssls jsonls bashls
:TSInstall lua ruby javascript typescript html css json bash tsx
```

---

## 🔍 Telescope Shortcuts

| Keybinding       | Description                      |
|------------------|----------------------------------|
| `<leader>ff`     | Find Files                       |
| `<leader>fg`     | Live Grep                        |
| `<leader>fb`     | Find Buffers                     |
| `<leader>fh`     | Help Tags                        |
| `<leader>fm`     | Find Model File (`app/models`)   |
| `<leader>fc`     | Find Controller File             |
| `<leader>fs`     | Find Service File                |
| `<leader>ft`     | Find Test File (`spec` or `test`)|
| `<leader>fdb`    | Find Migration File              |

---

## 🛠️ LSP + Diagnostic

| Keybinding       | Description                      |
|------------------|----------------------------------|
| `gd`             | Go to Definition                 |
| `K`              | Show Hover Doc                   |
| `gr`             | Find References                  |
| `<leader>lf`     | Format Current Buffer            |
| `<leader>ld`     | Show Diagnostics                 |

---

## 🧭 Window Navigation

| Mode     | Keybinding | Description             |
|----------|------------|-------------------------|
| Normal   | `<C-h>`    | Go to Left Split        |
| Normal   | `<C-j>`    | Go to Below Split       |
| Normal   | `<C-k>`    | Go to Upper Split       |
| Normal   | `<C-l>`    | Go to Right Split       |
| Terminal | `<C-h>`    | Terminal: Left Split    |
| Terminal | `<C-j>`    | Terminal: Below Split   |
| Terminal | `<C-k>`    | Terminal: Upper Split   |
| Terminal | `<C-l>`    | Terminal: Right Split   |

---

## 🌳 NvimTree File Management

| Keybinding   | Action                           |
|--------------|----------------------------------|
| `<leader>ee` | Toggle file explorer             |
| `<leader>ef` | Toggle on current file           |
| `<leader>ec` | Collapse file tree               |
| `<leader>er` | Refresh file tree                |
| `<leader>ev` | Open + focus on file tree        |
| `<leader>ma` | Add file/directory               |
| `<leader>mr` | Rename file/directory            |
| `<leader>md` | Delete file/directory            |

---

## ✨ Snippet + Completion

| Keybinding    | Action                          |
|---------------|---------------------------------|
| `<C-Space>`   | Trigger autocomplete popup      |
| `<CR>`        | Confirm selected item           |
| `<Tab>`       | Next item or jump to snippet    |
| `<S-Tab>`     | Previous item or snippet jump   |

---

## ℹ️ Notes

- `vim.g.mapleader` is set to `,`
- Snippets are loaded from both VSCode-style and SnipMate-style
- You can modify snippet sources inside:  
  `~/.config/nvim/lua/user/plugins/lsp/cmp.lua`
- Your `nvim-tree` custom mappings are handled via the `on_attach` hook

---

Clone your dotfiles:  
📁 [https://github.com/Odoia/nvim-dotfiles](https://github.com/Odoia/nvim-dotfiles)

## 🌲 NvimTree File Explorer Keybindings

### 🗂️ Local Keybindings (inside NvimTree window)

| Key | Action |
|-----|--------|
| `q` | Close Tree |
| `R` | Refresh Tree |
| `?` | Help |
| `<CR>` / `l` | Open |
| `h` | Close Directory |
| `v` | Open Vertical Split |
| `s` | Open Horizontal Split |
| `u` | Up a Directory |
| `C` | Set Root to Directory |
| `a` | Create |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `y` | Copy Name |
| `Y` | Copy Relative Path |
| `gy` | Copy Absolute Path |
| `I` | Toggle Git Ignore |
| `.` | Toggle Dotfiles |
| `f` | Filter by Name |
| `F` | Clear Filter |

### 🌍 Global Keybindings (usable from anywhere)

| Keybinding | Action |
|------------|--------|
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Toggle file explorer on current file |
| `<leader>ec` | Collapse file explorer |
| `<leader>er` | Refresh file explorer |
| `<leader>ev` | Open and focus NvimTree |
