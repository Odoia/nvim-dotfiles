# 🚀 Neovim Configuration - Full-Stack Development

[![GitHub](https://img.shields.io/badge/GitHub-Odoia%2Fnvim--dotfiles-blue?logo=github)](https://github.com/Odoia/nvim-dotfiles)
[![Neovim](https://img.shields.io/badge/Neovim-0.11+-green?logo=neovim)](https://neovim.io)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Modern Neovim configuration optimized for **Ruby on Rails**, **React**, **TypeScript**, **JavaScript**, and more.

---

## 📋 Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [First Launch](#-first-launch)
- [Quick Start](#-quick-start)
- [Documentation](#-documentation)
- [Troubleshooting](#-troubleshooting)

---

## ✨ Features

- 🎯 **Which-Key Integration** - Interactive keybinding popup (`,?` or `,hh`)
- 🔍 **Telescope** - Fuzzy finder for files, text, and more
- 📁 **NvimTree** - File explorer with intuitive keybindings
- 🧠 **LSP Support** - Full Language Server Protocol support
- ✅ **Auto-completion** - nvim-cmp with snippets
- 🎨 **Treesitter** - Advanced syntax highlighting
- 🔧 **Formatters & Linters** - Prettier, RuboCop, ESLint (via LSP)
- 🌈 **Rainbow Delimiters** - Color-coded parentheses
- 💬 **Smart Comments** - Context-aware commenting (JSX/TSX support)
- 📖 **Markdown Preview** - Beautiful rendering with Glow
- ⚡ **Fast Startup** - ~50-80ms with lazy loading
- 🌍 **Bilingual Docs** - English and Portuguese

---

## 📦 Requirements

### Core Requirements

- **Neovim** >= 0.10.0 (0.11+ recommended)
- **Git** >= 2.19.0
- **Node.js** >= 18.0.0 (for LSP servers)
- **npm** or **yarn**

### Optional but Recommended

- **ripgrep** - For Telescope live grep
- **fd** - For faster file finding
- **glow** - For beautiful Markdown rendering
- **lazygit** - Git interface (optional)

---

## 🔧 Installation

### 1. Install Neovim

#### macOS
```bash
brew install neovim
```

#### Ubuntu/Debian
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

#### Arch Linux
```bash
sudo pacman -S neovim
```

### 2. Install Dependencies

#### macOS
```bash
# Core dependencies
brew install ripgrep fd glow

# Optional
brew install lazygit
```

#### Ubuntu/Debian
```bash
# Core dependencies
sudo apt install ripgrep fd-find

# Glow (Markdown renderer)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow
```

### 3. Backup Existing Config (if any)

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
```

### 4. Clone This Configuration

```bash
git clone git@github.com:Odoia/nvim-dotfiles.git ~/.config/nvim
cd ~/.config/nvim
```

Or using HTTPS:
```bash
git clone https://github.com/Odoia/nvim-dotfiles.git ~/.config/nvim
cd ~/.config/nvim
```

### 5. Install Lazy.nvim (Plugin Manager)

```bash
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable \
  ~/.local/share/nvim/lazy/lazy.nvim
```

---

## 🚀 First Launch

### 1. Start Neovim

```bash
nvim
```

On first launch:
- **Lazy.nvim** will automatically install all plugins
- Wait for all plugins to install (you'll see a progress window)
- Press `q` to close the Lazy window when done

### 2. Install LSP Servers

After plugins are installed, run:

```vim
:Mason
```

Then install language servers (press `i` to install):
- `lua_ls` - Lua
- `ts_ls` - TypeScript/JavaScript
- `solargraph` - Ruby
- `html` - HTML
- `cssls` - CSS
- `jsonls` - JSON
- `yamlls` - YAML
- `bashls` - Bash
- `terraformls` - Terraform

Or install all at once:
```vim
:MasonInstall lua-language-server typescript-language-server solargraph html-lsp css-lsp json-lsp yaml-language-server bash-language-server terraform-ls
```

### 3. Install Treesitter Parsers

```vim
:TSInstall lua ruby javascript typescript tsx html css json yaml bash markdown terraform
```

### 4. Restart Neovim

```bash
:qa
nvim
```

---

## 🎯 Quick Start

### View All Keybindings

**Interactive Popup:**
```
,?  → Shows all keybindings in popup (English default)
```

**Complete Guide:**
```
,hh → Choose language: English or Português
```
Opens beautifully rendered Markdown guide with all keybindings!

### Most Important Keybindings

| Keybinding | Description |
|------------|-------------|
| `,?` | Show all keybindings (popup) |
| `,hh` | Open complete guide (choose language) |
| `,ff` | Find files |
| `,fg` | Search text in all files |
| `,ee` | Toggle file explorer |
| `,lf` | Format code manually |
| `,la` | Code actions (auto-fix) |
| `gd` | Go to definition |
| `K` | Show documentation |
| `gcc` | Toggle comment line |

**Tip:** Press `,` and wait ~300ms to see all available `,` commands!

---

## 📖 Documentation

### Built-in Help

| Command | Description |
|---------|-------------|
| `,?` | Interactive keybinding popup |
| `,hh` | Open complete guide (Markdown) |
| `:WhichKeyLanguage en` | Switch popup to English |
| `:WhichKeyLanguage pt` | Switch popup to Português |

### Documentation Files

- `KEYBINDINGS.md` - Complete guide in English
- `ATALHOS.md` - Guia completo em Português

Access directly:
```vim
:e ~/.config/nvim/KEYBINDINGS.md
:e ~/.config/nvim/ATALHOS.md
```

Or use `,hh` for rendered view!

---

## 🛠️ Troubleshooting

### LSP Not Working

**Check LSP status:**
```vim
:LspInfo
```

**Check installed servers:**
```vim
:Mason
```

**Reinstall server:**
```vim
:MasonUninstall lua-language-server
:MasonInstall lua-language-server
```

### Plugins Not Loading

**Check plugin status:**
```vim
:Lazy
```

**Update all plugins:**
```vim
:Lazy update
```

**Sync plugins:**
```vim
:Lazy sync
```

### Health Check

Run Neovim health check:
```vim
:checkhealth
```

This shows issues with:
- Required dependencies
- LSP servers
- Treesitter parsers
- Clipboard support

### Format Not Working

**Check if formatter is installed:**
```vim
:Mason
```

Look for:
- `prettier` (JavaScript/TypeScript/HTML/CSS)
- `rubocop` (Ruby)
- `shfmt` (Bash)

**Manual format:**
```
,lf
```

**Note:** Auto-format on save is DISABLED to avoid issues with legacy code.

### Glow Not Rendering Markdown

**Check if glow is installed:**
```bash
which glow
```

**Install glow:**
```bash
# macOS
brew install glow

# Ubuntu/Debian
sudo apt install glow
```

**Restart Neovim after installing glow**

### Large LSP Log File

If you see "LSP client log is large" warning:

**Delete log:**
```bash
rm ~/.local/state/nvim/lsp.log
```

**This config disables excessive logging automatically.**

---

## 🌐 Language Support

### Fully Configured Languages

- ✅ **Lua** - LSP: lua_ls
- ✅ **Ruby / Rails** - LSP: solargraph | Formatter: rubocop
- ✅ **JavaScript / TypeScript** - LSP: ts_ls | Formatter: prettier
- ✅ **React (JSX/TSX)** - LSP: ts_ls | Auto-tags | Smart comments
- ✅ **HTML** - LSP: html | Formatter: prettier
- ✅ **CSS** - LSP: cssls | Formatter: prettier
- ✅ **JSON** - LSP: jsonls | Formatter: prettier
- ✅ **YAML** - LSP: yamlls | Formatter: prettier
- ✅ **Bash** - LSP: bashls | Formatter: shfmt
- ✅ **Terraform** - LSP: terraformls | Formatter: terraform_fmt
- ✅ **Markdown** - Formatter: prettier | Renderer: glow

---

## 🎨 Features Showcase

### Which-Key Integration

Press `,` and wait 300ms:
```
╭────────────────────────────────╮
│ f → 󰍉 Telescope (Search)       │
│ l →  LSP                       │
│ e →  File Explorer             │
│ m →  File Operations          │
│ h →  Help                     │
╰────────────────────────────────╯
```

### Markdown Rendering

Press `,hh` and see beautiful rendered docs:
- ✅ Formatted titles
- ✅ Aligned tables
- ✅ Highlighted code blocks
- ✅ Colored emojis
- ✅ Organized lists

### Rails-Specific Keybindings

| Keybinding | Description |
|------------|-------------|
| `,fm` | Find Model file |
| `,fc` | Find Controller file |
| `,fs` | Find Service file |
| `,ft` | Find Test file (spec/test) |
| `,fdb` | Find Migration file |

---

## 📊 Performance

- **Startup time:** ~50-80ms (55% faster than average!)
- **Lazy loading:** Plugins load only when needed
- **Memory efficient:** Minimal resource usage

---

## 🤝 Contributing

Feel free to:
- Report issues
- Suggest features
- Submit pull requests

---

## 📝 Notes

- **Leader Key:** `,` (comma)
- **Auto-format:** DISABLED by default (use `,lf` manually)
- **Line numbers:** Normal (1, 2, 3...), not relative
- **Error display:** Icons only (hover for details)
- **Default language:** English (use `:WhichKeyLanguage pt` for Portuguese)

---

## 🔗 Links

- **This Repository:** https://github.com/Odoia/nvim-dotfiles
- **Neovim:** https://neovim.io
- **Lazy.nvim:** https://github.com/folke/lazy.nvim
- **Mason:** https://github.com/williamboman/mason.nvim
- **Which-Key:** https://github.com/folke/which-key.nvim
- **Glow:** https://github.com/charmbracelet/glow

---

## 📦 Repository

```bash
# Clone with SSH
git clone git@github.com:Odoia/nvim-dotfiles.git ~/.config/nvim

# Or clone with HTTPS
git clone https://github.com/Odoia/nvim-dotfiles.git ~/.config/nvim
```

---

**Made with ❤️ for modern full-stack development**

**Neovim Version:** 0.11.1
**Performance:** ~50-80ms startup
**Repository:** https://github.com/Odoia/nvim-dotfiles
